module CarRental::Platform {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    /// Struct representing a car rental listing.
    struct RentalListing has store, key {
        owner: address,     // Owner of the car
        price_per_day: u64, // Price of renting the car per day
        available: bool,    // Whether the car is available for rent
    }

    /// Function to create a new car rental listing.
    public fun create_listing(owner: &signer, price_per_day: u64) {
        let listing = RentalListing {
            owner: signer::address_of(owner),
            price_per_day,
            available: true,
        };
        move_to(owner, listing);
    }

    /// Function to rent a car.
    public fun rent_car(renter: &signer, listing_owner: address, days: u64) acquires RentalListing {
        let listing = borrow_global_mut<RentalListing>(listing_owner);

        // Ensure the car is available
        assert!(listing.available, 100);

        // Calculate the rental cost and withdraw it from the renter
        let rental_cost = listing.price_per_day * days;
        let payment = coin::withdraw<AptosCoin>(renter, rental_cost);

        // Deposit the payment to the listing owner
        coin::deposit<AptosCoin>(listing_owner, payment);

        // Mark the car as rented
        listing.available = false;
    }
}
