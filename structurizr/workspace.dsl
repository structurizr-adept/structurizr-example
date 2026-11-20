workspace "Vio Architecture" {
    !identifiers hierarchical

    model {
        properties {
            "structurizr.groupSeparator" "/"
        }

        archetypes {
            sync = -> {
                tags "Sync"
            }
            async = -> {
                tags "Async"
            }
            https = --sync-> {
                technology "HTTPS"
                tags "HTTPS"
            }
            rest = --https-> {
                technology "REST/HTTPS"
                tags "REST"
            }
            soap = --https-> {
                technology "SOAP/HTTPS"
                tags "SOAP"
            }
            sql = --sync-> {
                technology "SQL"
                tags "SQL"
            }
            redis = --sync-> {
                technology "Redis"
                tags "Redis"
            }
            kafka = --async-> {
                technology "Apache Kafka"
                tags "Kafka"
            }
            k8s_api = --sync-> {
                technology "Kubernetes API"
                tags "Kubernetes"
            }

            postgres = container {
                technology "Postgres"
                tags "Database" "Postgres"
            }
            redis = container {
                technology "Redis"
                tags "Cache" "Redis" 
            }
            microservice = container {
                tags "Microservice"
            }
            go_microservice = microservice {
                technology "Go"
                tags "Go"
            }
            kafka_topic = container {
                technology "Apache Kafka Topic"
                tags "Kafka" "Topic"
            }
        }

        user = person "User"

        browser = softwareSystem "Browser" {
            tag "Browser"
        }

        google = softwareSystem "Google" {
            tags "External" "Google"
        }
        apple = softwareSystem "Apple" {
            tags "External" "Apple"
        }

        hotel_providers = group "Hotel Providers" {
            booking = softwareSystem "Booking.com" {
                tags "External" "Booking" "booking.com"
                url "https://www.booking.com"
            }
            agoda = softwareSystem "Agoda.com" {
                tags "External" "Agoda" "agoda.com"
                url "https://www.agoda.com"
            }
            hikari = softwareSystem "Hikari Global" {
                tags "External" "Hikari" "hikariglobal.com"
                url "https://biz.hikariglobal.com/en-service"
            }
        }
        vio_partners = group "Vio Partners" {
            finn_no = softwareSystem "FINN.no" "Norway's largest online marketplace" {
                tags "External" "FINN"
                url "https://www.finn.no/reise/hotell"
            }
            holiday_pirates = softwareSystem "Holiday Pirates" "Online travel agency" {
                tags "External" "Holiday Pirates"
                url "https://www.holidaypirates.com"
            }
            traveluro = softwareSystem "Traveluro" "Online travel agency" {
                tags "External" "Traveluro"
                url "https://www.traveluro.com"
            }
        }

        algolia = softwareSystem "Algolia" "Search-as-a-service platform" {
            tags "External" "Algolia"
            url "https://www.algolia.com"
        }
        stripe = softwareSystem "Stripe" "Payment infrastructure platform" {
            payment_element = container "Payment Element" {
                description "Secure, pre-built, and customizable frontend UI component library"
                technology "Stripe Elements"
                tags "External" "Stripe"
                url "https://stripe.com/elements"
            }
            forwarding_api = container "Forwarding API" {
                description "Securely saves payment details and forwards them through a proxy"
                technology "Stripe Vault and Forward"
                tags "External" "Stripe"
                url "https://docs.stripe.com/api/forwarding/request"
            }
            payment_intents_api = container "Stripe Payment Intents API" {
                description "Primary transaction routing and processing engine"
                technology "Stripe Payments Core"
                tags "External" "Stripe"
                url "https://stripe.com/docs/api/payment_intents"
            }
            issuing_api = container "Stripe Issuing API" {
                description "Programmatic virtual card provisioning, spending controls, and ledger authorization engine"
                technology "Stripe Issuing Core"
                tags "External" "Stripe"
                url "https://docs.stripe.com/api/issuing/cards/create"
            }
            radar = container "Stripe Radar" {
                description "Real-time fraud prevention and risk assessment suite"
                technology "Stripe Radar"
                tags "External" "Stripe"
                url "https://docs.stripe.com/radar"
            }
            tags "External" "Stripe"
        }

        amazon_cognito = softwareSystem "Amazon Cognito" "Managed authentication and user identity service" {
            tags "External" "Cognito"
        }
        amazon_ses = softwareSystem "Amazon SES" "Cloud-based email service provider" {
            tags "External" "SES"
        }
        segment = softwareSystem "Segment" "Data router that syncs customer events to all business tools" {
            tags "External" "Segment"
            url "https://segment.com"
        }
        fullstory = softwareSystem "Fullstory" "Behavioral data and digital experience analytics platform" {
            tags "External" "Fullstory"
            url "https://www.fullstory.com"
        }
        zendesk = softwareSystem "Zendesk" "Cloud-based customer service and CRM platform" {
            tags "External" "Zendesk"
            url "https://www.zendesk.com"
        }
        mapbox = softwareSystem "Mapbox" "Highly customizable alternative to standard map providers" {
            tags "External" "Mapbox"
            url "https://www.mapbox.com"
        }
        clickhouse = softwareSystem "ClickHouse" "Ultra-fast columnar database built for real-time analytics" {
            tags "External" "ClickHouse" 
            url "https://clickhouse.com"
        }

        vio = softwareSystem "Vio" "Meta-search engine and Online Travel Agency" {
            kafka_cluster = group "Kafka Cluster" {
                bookings_status_topic = kafka_topic "Bookings Status Topic"
                offers_prices_topic = kafka_topic "Offers Prices Topic"
                fullstory_events_topic = kafka_topic "Fullstory Events Topic"
                segment_events_topic = kafka_topic "Segment Events Topic"
                pricing_events_topic = kafka_topic "Pricing Events Topic"
                notifications_topic = kafka_topic "Notifications Topic"
                content_updates_topic = kafka_topic "Content Updates Topic" "Hotels, places, rooms metadata changes"
                photo_links_topic = kafka_topic "Photo Links Topic" "Links to photos of hotels and rooms"
            }
            postgres_cluster = group "PostgreSQL Cluster" {
                hikari_db = postgres "Hikari Database" "Stores metadata and bookings of Hikari integration" {
                    meta_scheme = component "Meta scheme" "Contains tables: hotels, cities, countries, amenities" "Scheme" "Postgres"
                    bookings_scheme = component "Bookings scheme" "Contains tables: bookings, guests, history" "Scheme" "Postgres"
                    tag "Hikari"
                }
                booking_db = postgres "Booking Database" "Stores some data of Booking integration" {
                    tag "Booking"
                }
                agoda_db = postgres "Agoda Database" "Stores some data of Agoda integration" {
                    tag "Agoda"
                }
                content_db = postgres "Content Database" "Stores static hotels, places and countries metadata"
                bookings_db = postgres "Bookings Database"
                users_db = postgres "Users Database"
                payments_db = postgres "Payments Database"
                pricings_db = postgres "Pricings Database"
            }
            redis_cluster = group "Redis Cluster" {
                hikari_search_cache = redis "Hikari Cache" "Caches expensive search results" {
                    properties {
                        "TTL" "12 Hours"
                        "Eviction Policy" "LRU"
                        "Memory Limit" "4 GB"
                    }
                    tag "Hikari"
                }
                hikari_pricing_cache = redis "Hikari Pricing Cache" "Caches pricing schemes" {
                    properties {
                        "TTL" "not set"
                        "Eviction Policy" "noeviction"
                    }
                    tag "Hikari"
                }
                hikari_rate_limits_cache = redis "Hikari Rate Limits Cache" "Caches rate limits of Hikari integration"
                ota_offers_cache = redis "OTA Offers Cache" "Caches offers of OTA hotels" {
                    properties {
                        "TTL" "10 Minutes"
                        "Eviction Policy" "LRU"
                        "Memory Limit" "256 GB"
                    }
                }
                partners_rate_limits_cache = redis "Partners Rate Limits Cache" "Caches rate limits of partners"
                ab_testing_cache = redis "A/B Testing Cache" "Caches A/B testing in-memory cache invalidation rules"
            }
            managed_s3 = group "AWS Managed Object Storage" {
                photos_bucket = container "Photos Bucket" "Stores hotels photos" "S3 Bucket" {
                    tags "Object Storage" "S3" "S3 Bucket"
                }
                ab_testing_bucket = container "AB Testing Bucket" "Stores A/B testing data" "S3 Bucket" {
                    tags "Object Storage" "S3" "S3 Bucket"
                }
            }
            
            group "Hotel Providers Integrations" {
                group "Booking Integration" {
                    booking_adapter_api = container "Booking Adapter API"
                }
                group "Agoda Integration" {
                    agoda_adapter_api = container "Agoda Adapter API"
                }
                group "Hikari Integration" {
                    hikari_soap_api_service = go_microservice "Hikari SOAP API Service" "Translates internal REST requests to Hikari SOAP protocol"
                    hikari_integration_api = go_microservice "Hikari Integration API" "Internal entrypoint for Hikari integration services"
                    hikari_search_cache_warmer = go_microservice "Hikari Cache Warmer" "Pre-warms cache with dynamic search results on a schedule (cron)"
                    hikari_hotel_info_actualiser = go_microservice "Hikari Hotel Info Actualiser" "Reconciles Hikari hotel ID drift periodically (cron)"
                    hikari_photos_exporter = go_microservice "Hikari Photos Exporter" "Exports photos of hotels and rooms periodically (cron)"
                    hikari_callback_handler = go_microservice "Hikari Callback Handler" "Handles booking status callbacks"
                    hikari_pricing_consumer = go_microservice "Hikari Pricing Consumer"

                }
            }
            partners_api = microservice "Partners API"
            frontend = container "Frontend" "SSR + SPA Hybrid" "Next.js / Express" {
                tag "Frontend"
            }
            suggestion_service = microservice "Suggestion Service" "Provides places/cities/hotels suggestions"
            search_service = microservice "Search Service" "Search orchestration and aggregation" 

            booking_engine = microservice "Booking Engine" "Bookings state machine and orchestrator" {
                technology "Elixir/Cowboy"
                tags "Elixir"
            }

            payment_service = microservice "Payment Service" "Responsible for managing payments"
            pricing_service = microservice "Pricing Service" "Responsible for managing hotel providers pricing schemes for OTA"

            user_service = microservice "User Service"
            price_analytics_service = microservice "Price Analytics Service"
            price_watch_service = microservice "Price Watch Service"
            cms = microservice "CMS" {
                technology "Ruby on Rails"
                tags "Ruby on Rails"
            }

            fullstory_ingest_service = microservice "Fullstory Ingest Service" "Ingests events from frontend Fullstory library"

            notifications_service_consumer = microservice "Notifications Service"
            offers_prices_consumer = microservice "Offers Prices Consumer" 
            fullstory_events_consumer = microservice "Fullstory Events Consumer" 
            segment_events_consumer = microservice "Segment Events Consumer" 
            content_updates_consumer = microservice "Content Updates Consumer"
            photo_links_consumer = microservice "Photos Normalisation Service"

            tag "Vio"
            url "https://www.vio.com"
        }

        !elements vio_partners {
            this --rest-> vio.partners_api "Uses"
        }

        !element stripe {
            radar -> forwarding_api "Monitors transactions of"
            radar -> payment_intents_api "Monitors transactions of"
            forwarding_api -> hikari "Forwards user's credit card details to"
            issuing_api -> vio.payment_service "Sends 'issuing_transaction.created' (funds transferred to hotel provider from VCC) callback to"
            payment_element --https-> vio.frontend "Embeds PCI-compliant credit card form to"
        }

        !element vio.partners_api {
            --redis-> vio.partners_rate_limits_cache "Reads/Writes rate limits from"
            --rest-> vio.search_service "Forwards requests to"
            --sql-> vio.content_db "Reads content from"
        }

        vio.fullstory_ingest_service --kafka-> vio.fullstory_events_topic "Publishes Fullstory events to"

        !element vio.segment_events_consumer {
            --kafka-> vio.segment_events_topic "Consumes Segment events from"
            --https-> segment "Writes events in batches to"
        }
        !element vio.fullstory_events_consumer {
            --kafka-> vio.fullstory_events_topic "Consumes Fullstory events from"
            --https-> fullstory "Writes events in batches to"
        }
        !element vio.offers_prices_consumer {
            --kafka-> vio.offers_prices_topic "Consumes offers prices from"
            --sql-> clickhouse "Writes offers prices data to"
        }
        !element vio.hikari_pricing_consumer {
            --kafka-> vio.pricing_events_topic "Consumes pricing schemes updates from"
            --redis-> vio.hikari_pricing_cache "Caches pricing schemes to"
        }
        !element vio.content_updates_consumer {
            --kafka-> vio.content_updates_topic "Consumes content updates from"
            --https-> algolia "Periodically performs batch updates of indexes of"
        }
        !element vio.photo_links_consumer {
            --kafka-> vio.photo_links_topic "Consumes photo links from"
            --https-> vio.photos_bucket "Saves normalised photos to"
            --sql-> vio.content_db "Writes S3 photos object keys and bucket to"
            --kafka-> vio.content_updates_topic "Produces photo updates events to"
        }

        !element vio.search_service {
            --rest-> vio.booking_adapter_api "Searches offers of"
            --rest-> vio.agoda_adapter_api "Searches offers of"
            --rest-> vio.hikari_integration_api "Searches offers of"
            --kafka-> vio.offers_prices_topic "Publishes offers prices to"
            --https-> algolia "Queries index of"
            --redis-> vio.ota_offers_cache "Caches offers of hotels available for booking on Vio to"
        }

        !element vio.frontend {
            --https-> mapbox "Draws maps with"
            --https-> amazon_cognito "Authenticates users with"
            --https-> zendesk "Redirects users for support to"
            --rest-> vio.fullstory_ingest_service "Sends Fullstory events to"
            --rest-> vio.search_service "Search offers with"
            --rest-> vio.suggestion_service "Requests suggestions from"
            --rest-> vio.booking_engine "Initiates 'booking through Vio' flow"
            -> vio.frontend {
                tag "loop"
            }
            --rest-> vio.price_watch_service "Requests to watch prices"
            --rest-> vio.price_analytics_service "Requests price insights data from"
            --rest-> vio.user_service "Sends JWTs and user preferences to"
            --https-> vio.ab_testing_bucket "Requests and caches (in-memory) A/B testing config from"
            --redis-> vio.ab_testing_cache "Reads/writes A/B testing in-memory cache invalidation rules from"
        }

        !element vio.booking_engine {
            --rest-> vio.hikari_integration_api "Books rooms using"
            --sql-> vio.bookings_db "Reads/writes bookings info to"
            --kafka-> vio.bookings_status_topic "Consumes bookings status updates from"
            --rest-> vio.payment_service "Performs payment operations with"
            --kafka-> vio.notifications_topic "Produces bookings status notifications to"
            --kafka-> vio.segment_events_topic "Produces bookings related business events to"
            --rest-> vio.pricing_service "Reads/updates pricing schemes with"
        }

        !element vio.payment_service {
            --https-> stripe.payment_intents_api "Charges user's credit card and creates VCC for provider invoices with"
            --https-> stripe.forwarding_api "Forwards user's credit card information to hotel provider via"
            --https-> stripe.issuing_api "Creates VCC with spending limit via"
            --sql-> vio.payments_db "Stores payments information to"
        }

        !element vio.pricing_service {
            --kafka-> vio.pricing_events_topic "Produces events in case of pricing schemes changes to"
            --sql-> vio.pricings_db "Reads/Writes pricing schemes to"
        }

        !element vio.booking_adapter_api {
            --https-> booking "Communicates with"
            --sql-> vio.booking_db "Reads and writes from/to"
        }
        !element vio.agoda_adapter_api {
            --https-> agoda "Communicates with"
            --sql-> vio.agoda_db "Reads and writes from/to"
        }

        !element hikari {
            --soap-> vio.hikari_soap_api_service "Sends callback requests to"
            -> vio "Transfers money for booking in agency model via bank to"
        }
        !element vio.hikari_soap_api_service {
            --soap-> hikari "Translates and forwards requests to"
            --rest-> vio.hikari_callback_handler "Forwards callbacks to"
        }         
        !element vio.hikari_hotel_info_actualiser {
            --rest-> vio.hikari_soap_api_service "Fetches hotel metadata via"
            --sql-> vio.hikari_db.meta_scheme "Writes reconciled hotel metadata to"
        }
        !element vio.hikari_photos_exporter {
            --rest-> vio.hikari_soap_api_service "Requests hotels and rooms photos with"
            --kafka-> vio.photo_links_topic "Writes photo links to"
        }
        !element vio.hikari_integration_api {
            --redis-> vio.hikari_rate_limits_cache "Reads/Writes rate limits from"
            --rest-> vio.hikari_soap_api_service "Searches and books hotels via"
            --redis-> vio.hikari_pricing_cache "Reads pricing schemes from"
            --redis-> vio.hikari_search_cache "Reads and writes search results"
            --sql-> vio.hikari_db.meta_scheme "Reads hotels metadata from"
        }
        !element vio.hikari_search_cache_warmer {
            --rest-> vio.hikari_soap_api_service "Searches reservations with"
            --redis-> vio.hikari_search_cache "Writes warmed search results to"
        }
        !element vio.hikari_callback_handler {
            --sql-> vio.hikari_db.bookings_scheme "Writes booking status to"
            --kafka-> vio.bookings_status_topic "Publishes booking status updates to"
        }

        vio.suggestion_service --https-> algolia "Queries index of"

        user -> vio.frontend "Uses"

        segment -> fullstory "Sends backend events as a context to"

        vio.user_service -> vio.users_db "Stores users data to"

        !element vio.price_analytics_service {
            --sql-> clickhouse "Queries historical prices data from"
            --https-> algolia "Updates price buckets of hotels in the indexes of"
        }
        !element vio.price_watch_service {
            --rest-> vio.search_service "Polls specific offer's data from"
            --kafka-> vio.notifications_topic "Produces price change notifications to"
        }
        !element vio.notifications_service_consumer {
            --https-> amazon_ses "Sends emails via"
            --rest-> vio.user_service "Fetches notifications preferences from"
        }

        !element vio.cms {
            --https-> vio.ab_testing_bucket "Manages A/B testing rules"
        }

        production = deploymentEnvironment "Production" {
            external = deploymentNode "External" {
                browser = instanceOf browser
            }
            aws = deploymentNode "AWS Cloud" {
                tag "AWS Cloud"

                iam = infrastructureNode "AWS Identity and Access Management" {
                    description "Manages users, roles, and permissions"
                    technology "Amazon Identity and Access Management"
                    tag "AWS IAM"
                }
                sts = infrastructureNode "AWS Security Token Service" {
                    description "Issues temporary security credentials"
                    technology "Amazon Security Token Service"
                    tag "AWS STS"
                }
                eks_auth_api = infrastructureNode "AWS EKS Auth" {
                    description "Validates pod identity and brokers temporary AWS credentials via STS"
                    technology "Amazon EKS Auth API"
                    tag "AWS IAM Addon"
                }
                cognito = infrastructureNode "AWS Cognito" {
                    description "Manages user authentication"
                    technology "Amazon Cognito"
                    tag "AWS Cognito"
                }
                api_gateway = infrastructureNode "AWS API Gateway" {
                    description "Manages HTTP APIs"
                    technology "Amazon API Gateway"
                    tag "AWS API Gateway"
                }
                amazon_s3 = infrastructureNode "Amazon S3" {
                    description "Object storage"
                    technology "Amazon Simple Storage Service"
                    tag "AWS S3"
                }

                eu_region = deploymentNode "eu-central-1" {
                    description "Europe (Frankfurt)"
                    tag "AWS Region"

                    eks = deploymentNode "Amazon EKS" {
                        technology "Amazon Elastic Kubernetes Service"
                        tag "AWS EKS"

                        eks_control_plane = infrastructureNode "EKS Control Plane" {
                            description "AWS managed control plane (API server + etcd) for the EKS"
                            technology "Amazon Virtual Private Cloud (VPC)"
                            tag "AWS VPC"
                        }

                        vio_vpc = deploymentNode "Vio's VPC" {
                            description "Vio managed data plane of the EKS"
                            technology "Amazon Virtual Private Cloud (VPC)"
                            tag "AWS VPC"

                            az_a = deploymentNode "eu-central-1a" {
                                tag "AWS AZ"

                                subnet = deploymentNode "Private Subnet" {
                                    technology "Amazon Virtual Private Cloud (VPC) Subnet"
                                    tag "AWS Private Subnet"

                                    x_eni = infrastructureNode "Cross-account ENI" {
                                        description "Private network bridge for EKS"
                                        technology "Amazon Elastic Network Interface"
                                        tags "AWS ENI" "X-ENI"
                                    }
                                    alb_eni = infrastructureNode "ALB ENI" {
                                        description "Private network bridge for ALB"
                                        technology "Amazon Elastic Network Interface"
                                        tags "AWS ENI" "ALB ENI"
                                    }
                                    vpc_link_eni = infrastructureNode "VPC Link ENI" {
                                        description "Private network bridge for VPC Link"
                                        technology "Amazon Elastic Network Interface"
                                        tags "AWS ENI" "VPC ENI"
                                    }
                                    aurora_cluster = infrastructureNode "Amazon Aurora" {
                                        description "PostgreSQL-compatible database"
                                        technology "Amazon Aurora"
                                        tag "AWS Aurora"
                                    }
                                    elasticache_cluster = infrastructureNode "Amazon ElastiCache" {
                                        description "In-memory caching for applications"
                                        technology "Amazon ElastiCache"
                                        tag "AWS ElastiCache"
                                    }
                                    amazon_msk = infrastructureNode "Amazon MSK" {
                                        description "Fully managed Apache Kafka service"
                                        technology "Amazon Managed Streaming for Apache Kafka"
                                        tag "AWS MSK"
                                    }
                                    frontend_pods = deploymentNode "Frontend" {
                                        frontend = infrastructureNode "Vio Frontend Pod" {
                                            tag "Frontend"
                                        }
                                        instances 1..N
                                    }
                                    backend_pods = deploymentNode "Backend" {
                                        backend = infrastructureNode "Vio Backend Pod" {
                                            tag "Vio" "Backend"
                                        }
                                        instances 1..N
                                    }
                                }
                            }

                            elb = infrastructureNode "AWS Elastic Load Balancing" {
                                description "Provisions and manages AWS load balancers"
                                technology "Amazon Elastic Load Balancing"
                                tag "AWS ELB"
                            }
                            alb = infrastructureNode "AWS Application Load Balancer" {
                                description "Routes HTTP/HTTPS traffic to targets"
                                technology "Amazon Application Load Balancer"
                                tag "AWS ALB"
                            }
                            vpc_link = infrastructureNode "AWS VPC Link" {
                                description "Connects VPCs"
                                technology "Amazon Virtual Private Cloud (VPC) Link"
                                tag "AWS VPC Link"
                            }

                            elb_controller = infrastructureNode "AWS Load Balancer Controller" {
                                technology "Kubernetes Controller"
                                tag "Kubernetes Controller"
                            }
                            pod_identity_agent = infrastructureNode "Pod Identity Agent" {
                                description "Manages IAM roles for pods"
                                technology "Kubernetes DaemonSet"
                                tag "Kubernetes DaemonSet"
                            }

                            frontend_service = infrastructureNode "Frontend Service" {
                                description "Routes traffic to frontend pods"
                                technology "Kubernetes Service"
                                tag "Kubernetes Service"
                            }
                            backend_service = infrastructureNode "Backend Service" {
                                description "Routes traffic to backend"
                                technology "Kubernetes Service"
                                tag "Kubernetes Service"
                            }
                        }

                        tag "EKS"
                    }
                }
                api_gateway -> cognito "Validates JWTs and extracts claims"
                api_gateway -> eu_region.eks.vio_vpc.vpc_link "Sends requests over the private VPC Link tunnel"
                eks_auth_api -> sts "Internally assumes the IAM role on the pod's behalf, gets temp creds"
                sts -> iam "Evaluates role trust policy and permissions"

                !element eu_region.eks.vio_vpc {
                    !element frontend_service {
                        -> az_a.subnet.frontend_pods.frontend "Forwards traffic to frontend pods"
                    }
                    !element backend_service {
                        -> az_a.subnet.backend_pods.backend "Forwards traffic to backend pods"
                    }

                    !elements "element.tag==X-ENI" {
                        -> eks_control_plane "Bridges node/API traffic to the control plane"
                    }
                    !elements "element.tag==ALB ENI" {
                        -> alb "Is the network interface for"
                    }
                    !elements "element.tag==VPC ENI" {
                        -> vpc_link "Is the network interface for"
                    }

                    !element elb {
                        -> alb "Provisions and manages"
                    }

                    !element alb {
                        --https-> frontend_service "Routes traffic to"
                        --https-> backend_service "Routes traffic to"
                    }
                    !element vpc_link {
                        -> alb "Bridges traffic into the VPC"
                    }
                    !element elb_controller {
                        -> elb "Calls ELB API"
                    }
                    !element az_a.subnet {
                        !element backend_pods.backend {
                            --https-> pod_identity_agent "Sends its ServiceAccount JWT, requests credentials"
                            --kafka-> amazon_msk "Uses"
                            --redis-> elasticache_cluster "Uses"
                            --sql-> aurora_cluster "Uses"
                            --https-> amazon_s3 "Uses"
                        }
                    }
                    !element pod_identity_agent {
                        --https-> eks_auth_api "Calls AssumeRoleForPodIdentity with the JWT"
                    }
                }
            }
            browser --https-> aws.cognito "Authenticates users with"
            browser --https-> aws.api_gateway "Sends API requests with JWT"
        }
    }

    // !script scripts/producersTags.groovy
    // !script scripts/consumersTags.groovy

    views {
        properties {
            "plantuml.url" "https://www.plantuml.com/plantuml"
            "plantuml.sequenceDiagram" "true"
        }

        systemContext vio "000-system-context-view" {
            include *
            autoLayout tb
            title "System context view"
        }

        container vio "001-vio-view" {
            include "element.parent==stripe" *
            exclude "relationship.tag==loop"
            autoLayout tb
            title "Vio view (full)"
        }

        container vio "002-vio-view-restricted" {
            include *
            exclude "relationship.tag==loop"
            exclude "element.tag==Hikari" "element.tag==Booking" "element.tag==Agoda"
            include vio.hikari_integration_api vio.booking_adapter_api vio.agoda_adapter_api
            autoLayout tb
            title "Vio view (restricted)"
        }

        container vio "003-meta-search-view" {
            include "->vio.search_service->"
            exclude "relationship.tag==loop"
            autoLayout tb
            title "Meta-search view"
            description "Contains services related meta-search functionality"
        }

        container vio "004-ota-view" {
            include "element.parent==stripe"
            include "->vio.booking_engine->"
            exclude "relationship.tag==loop"
            autoLayout tb
            title "OTA view"
            description "Contains services related to OTA functionality"
        }

        container vio "005-hikari-integration-view" {
            include "->element.group==Hotel Providers Integrations/Hikari Integration->"
            autoLayout tb
            title "Hikari integration view"
            description "Contains services related to Hikari integration"
        }
        
        container vio "006-kafka-cluster-view" {
            include "->element.tag==Topic->"
            autoLayout tb
            title "Kafka users view"
            description "Contains all consumers and producers of all Kafka topics"
        }

        container vio "007-postgres-cluster-view" {
            include "->element.tag==Database->"
            autoLayout tb
            title "PostgreSQL cluster view"
            description "Contains all services using PostgreSQL cluster"
        }

        container vio "008-redis-cluster-view" {
            include "->element.tag==Cache->"
            autoLayout tb
            title "Redis cluster view"
            description "Contains all services using Redis cluster"
        }

        container vio "009-object-storage-cluster-view" {
            include "->element.tag==Object Storage->"
            exclude "relationship.tag==loop"
            autoLayout tb
            title "Object storage cluster view"
            description "Contains all services using Object storage cluster"
        }

        dynamic vio "100-suggest-flow" {
            user -> vio.frontend "Types \"seo\" in the search input on the home page"
            vio.frontend -> vio.suggestion_service "Sends GET /suggest?query=seo request to"
            vio.suggestion_service -> algolia "Formes query and sends request to"
            algolia -> vio.suggestion_service "Responds with search results to"
            vio.suggestion_service -> vio.frontend "Normalises results and responds to"
            vio.frontend -> user "Shows results to"
            autoLayout lr
            title "Suggest flow (live-search)"
        }

        dynamic vio "101-search-flow" {
            user -> vio.frontend "Completes suggest flow; chooses destination, dates and guests"
            vio.frontend -> vio.search_service "Sends GET /anchor request with placeId param from suggest flow to"
            vio.search_service -> algolia "Formes anchor query and sends request to"
            algolia -> vio.search_service "Responds with anchor search result to"
            vio.search_service -> vio.frontend "Normalises anchor and responds to"
            vio.frontend -> vio.search_service "Sends GET /search request anchor data to"
            vio.search_service -> algolia "Formes hotel metadata query and sends request to"
            algolia -> vio.search_service "Responds with hotel metadata and hotel ids to"
            vio.search_service -> vio.frontend "Normalises results and responds to"
            vio.frontend -> vio.frontend "Saves hotels metadata for future instant rendering"
            vio.frontend -> vio.search_service "Sends GET /search/poll request with hotel ids to once a second"
            vio.search_service -> algolia "Formes hotel id -> providers query and sends request to"
            algolia -> vio.search_service "Responds with hotel ids -> providers mapping to"
            {
                14: vio.search_service -> vio.hikari_integration_api "Sends blocking request to"
                14: vio.search_service -> vio.booking_adapter_api "Sends blocking request to"
                14: vio.search_service -> vio.agoda_adapter_api "Sends blocking request to"
            }
            15: vio.search_service -> vio.frontend "Responds with found hotel offers and status of polling to"
            16: vio.frontend -> user "Renders all found offers with hotel metadata instantly"
            autoLayout lr
            title "Search flow"
        }

        dynamic vio "102-booking-flow-merchant-model" {
            user -> vio.frontend "Completes search, chooses vio offer, opens hotel page"
            vio.frontend -> vio.search_service "Sends GET /rooms-offers request to"
            vio.search_service -> vio.ota_offers_cache "Reads hotel's rooms offers from"
            vio.search_service -> vio.frontend "Responds with cached hotel's rooms offers to"
            vio.frontend -> user "Renders rooms with offers"
            user -> vio.frontend "Presses \"book\" button"
            vio.frontend -> vio.search_service "Sends GET /offers/poll requests once a second to"
            vio.search_service -> vio.hikari_integration_api "Fetches fresh offers from"
            vio.search_service -> vio.frontend "Responds with fresh offers data to"
            vio.frontend -> vio.frontend "Redirects to checkout page if offer is present"
            stripe.payment_element -> vio.frontend "Injects iframe with credit card details form to"
            user -> vio.frontend "Fills out credit card details"
            vio.frontend -> vio.booking_engine "Sends booking request with encrypted card details to"
            vio.booking_engine -> vio.pricing_service "Requests pricing schemes for hotel provider"
            vio.pricing_service -> vio.booking_engine "Responds with pricing schemes of hotel provider to"
            vio.booking_engine -> vio.payment_service "Requests to charge user's credit card"
            vio.payment_service -> stripe.payment_intents_api "Requests to charge user's credit card"
            stripe.payment_intents_api -> vio.payment_service "Responds with transaction status to"
            vio.payment_service -> vio.payments_db "Saves transaction status to"
            vio.payment_service -> vio.booking_engine "Responds with transaction status to"
            vio.booking_engine -> vio.hikari_integration_api "Completes provider specific flow for booking property"
            hikari -> vio.hikari_soap_api_service "Sends booking status callback to"
            vio.hikari_soap_api_service -> vio.hikari_callback_handler "Forwards booking status callback to"
            vio.hikari_callback_handler -> vio.bookings_status_topic "Produces booking status updates to"
            vio.booking_engine -> vio.bookings_status_topic "Consumes booking status updates from"
            vio.booking_engine -> vio.payment_service "Requests to create VCC for hotel provider invoice"
            vio.payment_service -> stripe.issuing_api "Requests to create and issue VCC"
            stripe.issuing_api -> vio.payment_service "Responds with VCC status to"
            vio.payment_service -> vio.booking_engine "Responds with VCC status to"
            vio.booking_engine -> vio.notifications_topic "Produces booking status notifications to"
            stripe.issuing_api -> vio.payment_service "Sends 'funds transferred to hotel provider account' callback to"
            vio.payment_service -> vio.payments_db "Updates payment status in"
            autoLayout lr
            title "Booking flow [MERCHAT] model"
        }

        dynamic vio "103-booking-flow-agency-model" {
            user -> vio.frontend "Completes search, chooses vio offer, opens hotel page"
            vio.frontend -> vio.search_service "Sends GET /rooms-offers request to"
            vio.search_service -> vio.ota_offers_cache "Reads hotel's rooms offers from"
            vio.search_service -> vio.frontend "Responds with cached hotel's rooms offers to"
            vio.frontend -> user "Renders rooms with offers"
            user -> vio.frontend "Presses \"book\" button"
            vio.frontend -> vio.search_service "Sends GET /offers/poll requests once a second to"
            vio.search_service -> vio.hikari_integration_api "Fetches fresh offers from"
            vio.search_service -> vio.frontend "Responds with fresh offers data to"
            vio.frontend -> vio.frontend "Redirects to checkout page if offer is present"
            stripe.payment_element -> vio.frontend "Injects iframe with credit card details form to"
            user -> vio.frontend "Fills out credit card details"
            vio.frontend -> vio.booking_engine "Sends booking request with encrypted card details to"
            vio.booking_engine -> vio.hikari_integration_api "Completes provider specific flow for booking property"
            vio.booking_engine -> vio.pricing_service "Requests pricing schemes for hotel provider"
            vio.pricing_service -> vio.booking_engine "Responds with pricing schemes of hotel provider to"
            vio.booking_engine -> vio.payment_service "Requests to forward user's credit card details to provider"
            vio.payment_service -> stripe.forwarding_api "Requests to forward user's credit card details to provider"
            stripe.forwarding_api -> hikari "Sends user's credit card details to"
            hikari -> vio.hikari_soap_api_service "Sends booking status callback to"
            vio.hikari_soap_api_service -> vio.hikari_callback_handler "Forwards booking status callback to"
            vio.hikari_callback_handler -> vio.bookings_status_topic "Produces booking status updates to"
            vio.booking_engine -> vio.bookings_status_topic "Consumes booking status updates from"
            vio.booking_engine -> vio.notifications_topic "Produces booking status notifications to"
            autoLayout lr
            title "Booking flow [AGENCY] model"
        }

        dynamic vio "104-deal-freeze-flow" {
            user -> vio.frontend "Completes search, chooses vio offer, opens hotel page"
            vio.frontend -> vio.search_service "Sends GET /rooms-offers request to"
            vio.search_service -> vio.ota_offers_cache "Reads hotel's rooms offers from"
            vio.search_service -> vio.frontend "Responds with cached hotel's rooms offers to"
            vio.frontend -> user "Renders rooms with offers"
            user -> vio.frontend "Presses \"freeze deal\" button"
            vio.frontend -> vio.search_service "Sends GET /offers/poll requests once a second to"
            vio.search_service -> vio.hikari_integration_api "Fetches fresh offers from"
            vio.search_service -> vio.frontend "Responds with fresh offers data to"
            vio.frontend -> vio.booking_engine "Sends deal freeze request (if offer is present) to"
            vio.booking_engine -> vio.pricing_service "Requests pricing schemes for hotel provider"
            vio.pricing_service -> vio.booking_engine "Responds with pricing schemes of hotel provider to"
            vio.booking_engine -> vio.payment_service "Requests to create VCC for hotel provider invoice"
            vio.payment_service -> stripe.issuing_api "Requests to create and issue VCC"
            stripe.issuing_api -> vio.payment_service "Responds with VCC status to"
            vio.payment_service -> vio.payments_db "Saves VCC and transaction status to"
            vio.payment_service -> vio.booking_engine "Responds with VCC status to"
            vio.booking_engine -> vio.hikari_integration_api "Completes provider specific flow for booking property"
            hikari -> vio.hikari_soap_api_service "Sends booking status callback to"
            vio.hikari_soap_api_service -> vio.hikari_callback_handler "Forwards booking status callback to"
            vio.hikari_callback_handler -> vio.bookings_status_topic "Produces booking status updates to"
            vio.booking_engine -> vio.bookings_status_topic "Consumes booking status updates from"
            vio.booking_engine -> vio.notifications_topic "Produces booking status notifications to"
            vio.booking_engine -> vio.frontend "Responds with deal freeze status to"
            user -> vio.frontend "Chooses to proceed with 'deal freeze' offer"
            vio.frontend -> vio.frontend "Redirects to checkout page"
            stripe.payment_element -> vio.frontend "Injects iframe with credit card details form to"
            user -> vio.frontend "Fills out credit card details"
            vio.frontend -> vio.booking_engine "Sends booking request with encrypted card details to"
            vio.booking_engine -> vio.payment_service "Requests to charge user's credit card"
            vio.payment_service -> stripe.payment_intents_api "Requests to charge user's credit card"
            stripe.payment_intents_api -> vio.payment_service "Responds with transaction status to"
            vio.payment_service -> vio.payments_db "Saves transaction status to"
            vio.payment_service -> vio.booking_engine "Responds with transaction status to"
            stripe.issuing_api -> vio.payment_service "Sends 'funds transferred to hotel provider account' callback to"
            vio.payment_service -> vio.payments_db "Updates payment status in"
            autoLayout lr
            title "Deal freeze flow"
            description "Available only if choosen offer belongs to [MERCHAT] model"
        }

        component vio.hikari_db "hikari-db-view" {
            include *
            autoLayout lr
            title "Hikari database view"
        }

        image vio "200-suggest-flow-plantuml" {
            plantuml "100-suggest-flow"
            title "Suggest flow (Live-search) [plantuml]"
        }
        image vio "201-search-flow-plantuml" {
            plantuml "101-search-flow"
            title "Search flow [plantuml]"
        }
        image vio "202-booking-flow-merchant-model-plantuml" {
            plantuml "102-booking-flow-merchant-model"
            title "Booking flow [MERCHANT MODEL] [plantuml]"
        }
        image vio "203-booking-flow-agency-model-plantuml" {
            plantuml "103-booking-flow-agency-model"
            title "Booking flow [AGENCY MODEL] [plantuml]"
        }
        image vio "204-deal-freeze-flow-plantuml" {
            plantuml "104-deal-freeze-flow"
            title "Deal freeze flow [plantuml]"
        }

        deployment vio production "deployment-view-simplified" {
            include *
            autoLayout lr 100 200
            title "Deployment view (Simplified)"
            description "Only shows infrastructure and main relationships"
        }

        styles {
            element "Element" {
                shape RoundedBox
            }
            element "Person" {
                shape Person
                icon "https://cdn.frankerfacez.com/emoticon/762745/4"
            }
            element "Boundary" {
                strokeWidth 3
            }
            element "Group:Vio" {
                stroke #7130c9
                border solid
            }
            element "Group:Hotel Providers Integrations/Booking Integration" {
                stroke #273B7D
                icon "https://upload.wikimedia.org/wikipedia/commons/6/6b/Booking.com_Icon_2022.svg"
                border solid
            }
            element "Group:Hotel Providers Integrations/Agoda Integration" {
                stroke #FDB812
                icon "https://upload.wikimedia.org/wikipedia/commons/b/b0/Agoda_Logo_2022.svg"
                border solid
            }
            element "Group:Hotel Providers Integrations/Hikari Integration" {
                stroke #80bd44
                icon img/hikari.svg
                border solid
            }
            element "Group:Kafka Cluster" {
                icon "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/kafka-dark.png"
            }
            element "Group:PostgreSQL Cluster" {
                icon "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/postgres.png"
            }
            element "Group:Redis Cluster" {
                icon "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/redis.png"
            }
            element "Group:AWS Managed Object Storage" {
                icon "https://upload.wikimedia.org/wikipedia/commons/b/bc/Amazon-S3-Logo.svg"
            }
            relationship "Relationship" {
                thickness 4
            }
            element "Frontend" {
                icon "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/nextjs.png"
                shape WebBrowser
            }
            element "Browser" {
                shape WebBrowser
                icon "https://raw.githubusercontent.com/gilbarbara/logos/refs/heads/main/logos/firefox.svg"
            }
            element "AWS Aurora" {
                stroke #C925D1
                icon "https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/refs/heads/main/dist/Database/Aurora.png"
            }
            element "AWS ElastiCache" {
                stroke #C925D1
                icon "https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/refs/heads/main/dist/Database/ElastiCache.png"
            }
            element "AWS AZ" {
                stroke #00A4A6
                border dotted
            }
            element "AWS Private Subnet" {
                stroke #00A4A6
                icon "https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/refs/heads/main/dist/Groups/PrivateSubnet.png"
            }
            element "AWS MSK" {
                stroke #8C4FFF
                icon "https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/refs/heads/main/dist/Analytics/ManagedStreamingforApacheKafka.png"
            }
            element "AWS S3" {
                stroke #7AA116
                icon "https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/refs/heads/main/dist/Storage/SimpleStorageService.png"
            }
            element "AWS Cognito" {
                stroke #DD344C
                icon "https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/refs/heads/main/dist/SecurityIdentityCompliance/Cognito.png"
            }
            element "AWS ALB" {
                stroke #8C4FFF
                icon "https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/refs/heads/main/dist/NetworkingContentDelivery/ElasticLoadBalancingApplicationLoadBalancer.png"
            }
            element "AWS ELB" {
                stroke #8C4FFF
                icon "https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/refs/heads/main/dist/NetworkingContentDelivery/ElasticLoadBalancing.png"
            }
            element "AWS STS" {
                stroke #DD344C
                icon "https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/refs/heads/main/dist/SecurityIdentityCompliance/IdentityAccessManagementAWSSTS.png"
            }
            element "AWS EKS" {
                stroke #ED7100
                icon "https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/refs/heads/main/dist/Containers/ElasticKubernetesService.png"
            }
            element "AWS Region" {
                stroke #00A4A6
                border dotted
                icon "https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/refs/heads/main/dist/Groups/Region.png"
            }
            element "AWS Cloud" {
                icon "https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/refs/heads/main/dist/Groups/AWSCloud.png"
            }
            element "Kubernetes Service" {
                stroke #ED7100
                icon "https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/refs/heads/main/dist/Containers/ElasticKubernetesService.png"
            }
            element "Kubernetes Controller" {
                stroke #232F3E
                icon "https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/refs/heads/main/dist/General/Gear.png"
            }
            element "Kubernetes DaemonSet" {
                stroke #232F3E
                icon "https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/refs/heads/main/dist/General/Gear.png"
            }
            element "AWS IAM" {
                stroke #DD344C
                icon "https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/refs/heads/main/dist/SecurityIdentityCompliance/IAMIdentityCenter.png"
            }
            element "AWS IAM Addon" {
                stroke #DD344C
                icon "https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/refs/heads/main/dist/SecurityIdentityCompliance/IdentityAccessManagementAddon.png"
            }
            element "AWS API Gateway" {
                stroke #8C4FFF
                icon "https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/refs/heads/main/dist/NetworkingContentDelivery/APIGateway.png"
            }
            element "AWS VPC Link" {
                stroke #8C4FFF
                icon "https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/refs/heads/main/dist/NetworkingContentDelivery/PrivateLink.png"
            }
            element "AWS ENI" {
                stroke #8C4FFF
                icon "https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/refs/heads/main/dist/NetworkingContentDelivery/VPCElasticNetworkInterface.png"
            }
            element "AWS VPC" {
                stroke #8C4FFF
                icon "https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/refs/heads/main/dist/Groups/VPC.png"
            }
            element "Elixir" {
                icon "https://upload.wikimedia.org/wikipedia/en/7/7a/Elixirlogo_small.svg"
            }
            element "Database" {
                shape Cylinder
            }
            element "Cache" {
                shape Cylinder
            }
            element "S3 Bucket" {
                shape Cylinder
            }
            element "Topic" {
                shape Pipe
            }
            element "Component" {
                shape Component
            }
            element "Postgres" {
                icon "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/postgres.png"
            }
            element "Redis" {
                icon "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/redis.png"
            }
            element "Go" {
                icon "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/golang.png"
            }
            element "Kafka" {
                icon "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/kafka-dark.png"
            }
            element "Ruby on Rails" {
                icon "https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Ruby_On_Rails_Logo.svg/960px-Ruby_On_Rails_Logo.svg.png"
            }
            element "S3" {
                icon "https://upload.wikimedia.org/wikipedia/commons/b/bc/Amazon-S3-Logo.svg"
            }
            element "External" {
                background #ffffff
                colour #000000
                stroke #000000
            }
            element "FINN" {
                stroke #0063fc
                colour #0063fc
                icon "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Finn.no-logo.svg/960px-Finn.no-logo.svg.png"
            }
            element "Holiday Pirates" {
                stroke #502748
                colour #502748
                icon img/hp.svg
            }
            element "Traveluro" {
                stroke #01579b
                colour #01579b
                icon img/traveluro.svg
            }
            element "Vio" {
                stroke #7130c9
                icon img/vio.svg
            }
            element "booking.com" {
                stroke #273B7D
                colour #273B7D
                strokeWidth 10
                icon "https://upload.wikimedia.org/wikipedia/commons/6/6b/Booking.com_Icon_2022.svg"
            }
            element "agoda.com" {
                colour #585856
                stroke #FDB812
                strokeWidth 10
                icon "https://upload.wikimedia.org/wikipedia/commons/b/b0/Agoda_Logo_2022.svg"
            }
            element "hikariglobal.com" {
                colour #145fac
                stroke #80bd44
                icon img/hikari.svg
            }
            element "Fullstory" {
                icon img/fullstory.svg
            }
            element "Zendesk" {
                colour #03363d
                stroke #03363d
                icon "https://upload.wikimedia.org/wikipedia/commons/c/c8/Zendesk_logo.svg"
            }
            element "Stripe" {
                colour #5167FC
                stroke #5167FC
                icon "img/stripe.svg"
            }
            element "Algolia" {
                colour #003DFF
                stroke #003DFF
                icon "https://upload.wikimedia.org/wikipedia/commons/4/4c/Algolia_logo_full_blue.svg"
            }
            element "ClickHouse" {
                stroke #faff69
                icon "img/ch.svg"
            }
            element "Segment" {
                icon "https://raw.githubusercontent.com/gilbarbara/logos/refs/heads/main/logos/segment.svg"
            }
            element "Mapbox" {
                icon "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Mapbox_logo_2019.svg/330px-Mapbox_logo_2019.svg.png"
            }
        }
    }
}
