
sre@k8s-controller-01:~$ which etcd
sre@k8s-controller-01:~$ sudo ls -l /etc/kubernetes/pki/etcd/server.crt 
-rw-r--r-- 1 root root 1220 Oct 24 21:23 /etc/kubernetes/pki/etcd/server.crt

sre@k8s-controller-01:~$ sudo ls -l /var/lib/etcd
total 4
drwx------ 4 root root 4096 Oct 24 21:23 member
sre@k8s-controller-01:~$ sudo find /var/lib/etcd
/var/lib/etcd
/var/lib/etcd/member
/var/lib/etcd/member/snap
/var/lib/etcd/member/snap/db
/var/lib/etcd/member/wal
/var/lib/etcd/member/wal/0.tmp
/var/lib/etcd/member/wal/0000000000000000-0000000000000000.wal

sre@k8s-controller-01:~$ sudo cat /etc/kubernetes/pki/etcd/server.key
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEA3uTPoou3Yl+Ewg/5m+yYvmZIZWy6Q1MNlVvbpxaI3kp0Vp38
rhPlS0CfGhFwjVPXbCGdlFUEkCzzcNiOn6PE7TuJ7xwrbdyEVfPgpw7/h3HPgEwo
8C4SutRxDuA1+4VrcTIElTi6q2fzP/HsBqn9NYLAWbF2IfMUBxBhV7zE8kqPFPPh
9heIvUtHG2GMFEva6swX05QVwaRAl+QqY8cZ1AEgYUDb8w9J9l1A8QM97niqU63g
GSCbxBcHB3MJC1iOA2NhSn2jv5JOeRLrV0ptBM1u6e2obCpdNWfJurwvzIzV5RTS
NKEkcyTPyPx9/ejuo0zX0jNi109ZnZE4RcUEswIDAQABAoIBAQC3nzxGpl9PFW2j
CdISWBmFUXH2zFmuOO+JygDsZ64doqyw5rpRFmbhVb08ln1okFd55z+QAXIe7Eko
/96POTV0UoZRi51jhjUnMiAywDJWfLX69cMMCoi3jWgOXztZmBJpUFFiNTfjGWHV
nhFZdBT7Tln0CjRNx5kKML5gr0x4ZNZPyFKJr7M5gxUaQXY0BL/NLHjNPalTcy5y
EDIp0XobL/iy9Q3FCGnwVxhn9CcUud/woiZDBYC8jV78vnJPxeTvVKfC6MBlYvh9
OusspJCtgyi9btNBriKFQRVe+sqmcxrq9/+/+EF83GI09fjp9YTz/5M7orRtkgrJ
Zaf9/k5hAoGBAOpOEoMQoAmaBQ+geTsjLshH+PcUSUNLZHjZX4PIoVOuLcaCo49I
+fSMJ003FeB33gj9mEoZjQVLNiwnsYFhVyp7w4sSRIZWhi5n74kjgC7UUZr0tILu
IMtmbfwSB6r4Guk496FTEk2Ti35YaRMoh4zLFVmX39dpJcvrrV9EqbqpAoGBAPOI
QAMKqxwNGdxXAFNX9GtESPd8rgh2s7HBlAWloNQwdLfmpd5uSmgfKjyZmKCg/8Gd
Y2uLuvt36Rkcq2QcQizG+W3jGWC2VEsU+1MRsvIiKi+BmwxSSNwX9e5lFFRr6ZZF
K0xwhIsKSJd8bdX5t9Yopq2ei6WtuepF3UdX7Jn7AoGAYyDaxiavfsBx6bWb9MAi
18tTcr1bbaQlAtf8iBXG409qwHSe3E0kqyjsq8dlcw1jm+wmlRsQRbAXYED+4V0c
crXf+iOlaCyNIm8Isb2aSrW7PNLQ2CAFMejJGX9LTTMgt5FJezBZKwcEWlTvR5K7
Hn8BLmGJ62np+sdgF1FGedkCgYBFHd5M/rIhe/Zi+q40+Tl9WBv9YX1jGY1WXcJM
9/z1O+tkZimdP2AOvQmXuV//9rGfmbOlyjp/NEELx389ImgFnVMdRN7m+9hglsvd
f6Bx6BBg+z+t94yGKqa5yiZC732UEH2BbE2xyHFhzQa/O+hY96CWlfC8TNn/C2UJ
4oJcEQKBgBbhnvGR7PN/L49vXNoi37yK4mY+SU8Di60DctNWSIlNjyjY3WG3U1oq
RWb/QGFceSwqZ1UAFWqR0TxghmwOhR4Xar1jEj4xi+z6mkDcIoWlRiqHl+8EsMi/
D+xBGJPvOY+zrW4Oaak5XMRiodYmYipJQVe/C85uOhUOtX5U57DO
-----END RSA PRIVATE KEY-----

sre@k8s-controller-01:~$ sudo cat /etc/kubernetes/pki/etcd/peer.crt
-----BEGIN CERTIFICATE-----
MIIDWTCCAkGgAwIBAgIIf2xosyi9RoMwDQYJKoZIhvcNAQELBQAwEjEQMA4GA1UE
AxMHZXRjZC1jYTAeFw0yNDEwMjQyMTE4MzJaFw0yNTEwMjQyMTIzMzJaMBwxGjAY
BgNVBAMTEWs4cy1jb250cm9sbGVyLTAxMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
MIIBCgKCAQEAv7jHCKfoSKD5morSf6uNhZxQYUA73mtpm4sLMFUiudqjFyPH8UtC
McF3TYihbY6OnqYW//U5U/865qHYGpjcFJMz66UJhoO+q6AKnguuhP+0hyfnUx++
vCZeuvZ1zGe7hZY0zP8vlthTxJ3Fd/AqHp3DdRP0XEmeri6+4vCR3OK+N02Q9DTZ
1hN2uxirvr/cLu/jzM83A9RMEDdmncv6mnpNvAo8Cnyr4NdBI9+FeLH0kH07XbO0
YsAEH+fVawLvX7Phf4JU+YYxC5N6aFlvVbC/MTNKlukaL5940PGpiPfkH6+l36+v
GyOoX1tdUL2DGtQfOiVJbsx0wLtj7epC2wIDAQABo4GoMIGlMA4GA1UdDwEB/wQE
AwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDAQYIKwYBBQUHAwIwDAYDVR0TAQH/BAIw
ADAfBgNVHSMEGDAWgBRtuuQqY/Z85oMUM02prJyGbG9prDBFBgNVHREEPjA8ghFr
OHMtY29udHJvbGxlci0wMYIJbG9jYWxob3N0hwTAqAFphwR/AAABhxAAAAAAAAAA
AAAAAAAAAAABMA0GCSqGSIb3DQEBCwUAA4IBAQA4bdQkHt2PtKmVme3yOALiRy/c
+V+g4IOJFu1UN6blygPfQG1ZDTOjbxQ0gwmycvKK6hoo+d3NdR8eazDUoceVlbcq
EkiDp0EL7Ycu/SG4WIfRPBLg8EkGDgWEDrHGcVR7hb5TjTwPqm491O7nA1/TR6Rs
OWQ4vzP479j4CBQfYMK9GyAheL8UQgbcAnknMRXp9s3O9JlSgI9Ssi9aTm0gW3af
WGSTNU6JwFekt/5J+7AU5I4teEIXoyRJi3+6+Xaz0EXynahqvZyzOR6pXg74o86G
MnF/3Bq8VUZ/2TAzJSxeeXs93fs0PCfT7rTzkWoPoD4AY/sZ5gUZ9VUb8wih
-----END CERTIFICATE-----

sre@k8s-controller-01:~$ sudo cat /etc/kubernetes/pki/etcd/peer.key
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAv7jHCKfoSKD5morSf6uNhZxQYUA73mtpm4sLMFUiudqjFyPH
8UtCMcF3TYihbY6OnqYW//U5U/865qHYGpjcFJMz66UJhoO+q6AKnguuhP+0hyfn
Ux++vCZeuvZ1zGe7hZY0zP8vlthTxJ3Fd/AqHp3DdRP0XEmeri6+4vCR3OK+N02Q
9DTZ1hN2uxirvr/cLu/jzM83A9RMEDdmncv6mnpNvAo8Cnyr4NdBI9+FeLH0kH07
XbO0YsAEH+fVawLvX7Phf4JU+YYxC5N6aFlvVbC/MTNKlukaL5940PGpiPfkH6+l
36+vGyOoX1tdUL2DGtQfOiVJbsx0wLtj7epC2wIDAQABAoIBAHgI8FRzC/OtFZm0
oOZeOlUU8R5yYQl4pr5D59Vy+DL0uHecZ2qje+Y7Ar8AdFFrl8+snWnT1vjIK9CK
NAsy+VfIchFvWu9lPNOnd/5LwhBzKEwWp7Zbgce7HkRgWpCHwdh5msVeYCVJe+j1
/tSBAV352I5M2AmP7lGP4uOjSy/HkJSL68An7wmyNTqYYir7JElnoOsOXG2WvEmf
haSW6J3y/1TDoqRprSFjcUgW61xn8zSA3hae6tm4dTDUdQpWejc96Ftbx4IhLayo
k6zq/HprY37von3WYvWJuDwqCCY+YxMdNrEdiVkn0cEOrIGRVe3Djm6tjL3CV3GD
8t5fkcECgYEA7+7fLcvwWNKwM5YrOnu42JnhkMu7NOPKPhpnSpOjaMEphc+9UDAL
ZY9mvxwasb7G6MrpdCPP0tgAAKH7CXR5Yy4yJ258rYJlHYvEsy/fDJgTyOXxRZY7
HKL0dcqWK4DIdHpKrhsfNG0oKvaz2NtYrAm5FvKtImH6XAWQDgN34IUCgYEAzI9t
owUBrSzoL3LnxcrON+lu49U1s8nFadiwuCO8LX6zxiCwmYwz+Qjp0/bY65BFSi8q
jAiLrUelt3es+OQ/WX8rYZBsGyzOORi/88ILbAphB8x2EbI2S7zN3U3q3QNnIUZC
hGGP3WoLZMvtXCDBlIoVan4ZMrV63g9mZ4U1o98CgYBvbkwec9nDFs6YlsSq260E
g6sb2VKvhJ936kFQhHLfAt7q84kjxbx1RX1dgorvRAATO7Hiq4MolAKkSJZTVNHP
ezP11j13Q9j8ON54reH0cmi14/0C6Xu4mAHa9uR5fc0bM3SdmaELcyq1kXADZhOv
irB4dOptzn084aR+raOuFQKBgQCIwAmnRZ2NS8wcjFBtZdrefetn3Az+mBClZfsd
3qXaNC2ycgAdZiEIhvDqhscVE2l+4nErFDtsJ82dDSBRcyT2i5FQs9/Reu6SNP19
02cXXwjm0cTMp7qsfxeQrpooDjJPiEzHewFWH6JmS/3t7Of8iSMwAgSOZcwxz1HC
OsdVOQKBgBbBS9UjRyxy9T7K6NapVes0v5ola/0yFMMFimwqw3ruU3RYRiUqZ7oN
eE8C+2c1WF/CgdYuoSN6PArz1wKItk4GfsegyO4raC1vp6w49Dhw8ZA8/v+EboFq
PrF9iyx51AHnftzBeJGP/mvPS0yEeUiB8TcXqwY6CPLXwwvRALJv
-----END RSA PRIVATE KEY-----

sre@k8s-controller-01:~$ sudo cat /etc/kubernetes/pki/etcd/ca.crt
-----BEGIN CERTIFICATE-----
MIIC/DCCAeSgAwIBAgIIPOmcmzDIhuMwDQYJKoZIhvcNAQELBQAwEjEQMA4GA1UE
AxMHZXRjZC1jYTAeFw0yNDEwMjQyMTE4MzJaFw0zNDEwMjIyMTIzMzJaMBIxEDAO
BgNVBAMTB2V0Y2QtY2EwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC7
1W+C50aXsJnrosUDGsYMk0tZhuhKQdFikuYGHsq46GPaRWWXpT4e3G8Y6LheWfoY
Zr7Ey1N0UnvfHrM4Rhvk6ukr7DTxvaTi6Tx32jXEaXyaBRa65kVhAkdhD8vAI1ax
eHZ8JLzo1Uhe2//WriPGcVvWUlridxPCqwUXlQ8sSMG7il9w+5dBYpRrNbKWGLZ+
7ZqN3JU92VMG0mlmTGdEqmHSWubQBPLfBpuSBh2x0p7CQGJfghhi2FnivM9bLDoj
ZZOfCK9mRZpwIxsfaNzGwhXfg9ldalthrcD/MSS8DpjsYBVrI1+7mBHNIbhoo3Vr
vB9XL/puFY9uhxirGB6bAgMBAAGjVjBUMA4GA1UdDwEB/wQEAwICpDAPBgNVHRMB
Af8EBTADAQH/MB0GA1UdDgQWBBRtuuQqY/Z85oMUM02prJyGbG9prDASBgNVHREE
CzAJggdldGNkLWNhMA0GCSqGSIb3DQEBCwUAA4IBAQBvYhlNcZJqmYj1ikrX636E
rQ8uqjQ6ZePDrYN+kVtM9999RU00HpZxnbK+foGULyKubd9EDgyITxCwvlL08CZD
1LaWUdv2+VVDuUtcPPy8kew0cm6nzQT4MzDWkn16o7gBiEQ8NuOGik2zflBZ7XnQ
GfEsq+5P0OIx5oYWlz4Ae9ecHQbd6ITFzmLLJoxwhB8VHCXpKnkFFjnNJ2THsh+j
8lVKUfuizMHya8afCiKwNFI3CHGjriDfKKpWefrqHS5tyn4Ez3rDLn7MCW1xx8S5
6qdGIsCllGMQFJbE71dDcPO4RkTcKlzOuJ7O9nUFvJYTFhFpWBG5hZatGZTMZfsg
-----END CERTIFICATE-----

