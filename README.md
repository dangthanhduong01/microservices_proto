# Microservice Protobuf

This repository contains protobuf definitions and generated Go code for 4 microservices.

## Services

| Service | Module Path | Latest Version |
|---------|-------------|----------------|
| Order | `github.com/dangthanhduong01/microservices_proto/pb/order` | `v1.0.1` |
| Payment | `github.com/dangthanhduong01/microservices_proto/pb/payment` | `v1.0.1` |
| Shipping | `github.com/dangthanhduong01/microservices_proto/pb/shipping` | `v1.0.1` |
| Auth | `github.com/dangthanhduong01/microservices_proto/pb/auth` | `v1.0.0` |

## Usage

To use any of these services as a dependency in your Go project, add the required module to your `go.mod` file:

```go
require (
    github.com/dangthanhduong01/microservices_proto/pb/order v1.0.1
    github.com/dangthanhduong01/microservices_proto/pb/payment v1.0.1
    github.com/dangthanhduong01/microservices_proto/pb/shipping v1.0.1
    github.com/dangthanhduong01/microservices_proto/pb/auth v1.0.0
)
```

Then run:

```bash
go mod tidy
```

## Available gRPC Services

### Order Service
- `CreateOrder(ctx context.Context, in *CreateOrderRequest) (*CreateOrderResponse, error)`
- `GetOrder(ctx context.Context, in *GetOrderRequest) (*GetOrderResponse, error)`
- `UpdateOrder(ctx context.Context, in *UpdateOrderRequest) (*UpdateOrderResponse, error)`
- `DeleteOrder(ctx context.Context, in *DeleteOrderRequest) (*DeleteOrderResponse, error)`
- `ListOrders(ctx context.Context, in *ListOrdersRequest) (*ListOrdersResponse, error)`

### Payment Service
- `CreatePayment(ctx context.Context, in *CreatePaymentRequest) (*CreatePaymentResponse, error)`
- `GetPayment(ctx context.Context, in *GetPaymentRequest) (*GetPaymentResponse, error)`
- `UpdatePayment(ctx context.Context, in *UpdatePaymentRequest) (*UpdatePaymentResponse, error)`
- `DeletePayment(ctx context.Context, in *DeletePaymentRequest) (*DeletePaymentResponse, error)`

### Shipping Service
- `CreateShipping(ctx context.Context, in *CreateShippingRequest) (*CreateShippingResponse, error)`
- `GetShipping(ctx context.Context, in *GetShippingRequest) (*GetShippingResponse, error)`
- `UpdateShipping(ctx context.Context, in *UpdateShippingRequest) (*UpdateShippingResponse, error)`
- `DeleteShipping(ctx context.Context, in *DeleteShippingRequest) (*DeleteShippingResponse, error)`

### Auth Service
- `RegisterUser(ctx context.Context, in *RegisterUserRequest) (*RegisterUserResponse, error)`
- `LoginUser(ctx context.Context, in *LoginUserRequest) (*LoginUserResponse, error)`
- `UpdateUser(ctx context.Context, in *UpdateUserRequest) (*UpdateUserResponse, error)`
- `VerifyEmail(ctx context.Context, in *VerifyEmailRequest) (*VerifyEmailResponse, error)`

## Versioning

Each service has its own version tag following the pattern `pb/<service>/v<version>` (e.g., `pb/order/v1.0.1`).

## Development

To regenerate the protobuf code, run:

```bash
./protoc.sh <service_name> <version>
```

Or push to main branch - GitHub Actions will automatically generate and tag the code.