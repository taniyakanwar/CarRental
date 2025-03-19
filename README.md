# CarRental::Platform

## Overview
CarRental::Platform is a decentralized car rental system built on the Aptos blockchain using the Move language. This smart contract allows users to list their cars for rent, set a daily rental price, and securely manage transactions between car owners and renters.

## Features
- **Car Rental Listing**: Owners can list their cars for rent with a specified daily price.
- **Secure Transactions**: Payments are processed using AptosCoin to ensure trustless transactions.
- **Availability Management**: Cars are marked as unavailable once rented, preventing double bookings.
- **Decentralized Ownership**: All transactions are recorded on the blockchain, ensuring transparency and security.

## Smart Contract Structure
### 1. `RentalListing` Struct
Defines a rental listing with the following attributes:
- `owner`: Address of the car owner.
- `price_per_day`: Rental price per day.
- `available`: Boolean flag indicating whether the car is available for rent.

### 2. `create_listing` Function
Allows car owners to create a new listing by providing:
- `owner`: The signer's address.
- `price_per_day`: The rental price per day.

### 3. `rent_car` Function
Enables users to rent a car by performing the following operations:
- Checks if the car is available.
- Calculates the rental cost based on the number of rental days.
- Withdraws the required funds from the renter's account.
- Deposits the rental amount into the owner's account.
- Marks the car as unavailable.

## Usage
1. **Deploy the contract** on the Aptos blockchain.
2. **Car owners list their cars** using `create_listing`.
3. **Renters select a car** and rent it using `rent_car`, ensuring secure payment and ownership transfer for the rental period.

## Future Enhancements
- Implement a return mechanism to mark the car as available after rental completion.
- Add reputation scoring for renters and owners.
- Introduce dispute resolution and insurance mechanisms.

Contract Address: 0x45cc252cece024b69ea3603dc749627a161692904e8b402c3766463c0065dc72

![image](https://github.com/user-attachments/assets/5db45f79-55a5-4cde-9054-fe990348c56c)
