# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
loans = LoanType.create([
                          { name: 'The Adventurer',
                            description: 'Got a holiday in mind but you are a little short?
                            The Adventurer offers a quick short term unsecured cash injection
                            at very attractive rates. It is tied to your salary account
                            so automatic deductions',
                            max_amount: 500_000,
                            interest_rate: 13,
                            duration: 180,
                            image_url: 'https://picsum.photos/id/1039/6945/4635' },
                          { name: 'The Educator',
                            description: 'Kiss school fees arrears goodbye as we cover you
                            and your child\'s fees. Educator pays the fees at the beginning
                            of each semester or term. Allowing you to focus on education.',
                            max_amount: 200_000,
                            interest_rate: 10,
                            duration: 365,
                            image_url: 'https://picsum.photos/id/0/5616/3744' },
                          { name: 'The Builder',
                            description: 'Your dream house is just a click away. With a fixed
                            interest rate, no bank mortgage can beat this.
                            Get a 90 day grace period before
                            deductions begin.',
                            max_amount: 50_000_000,
                            interest_rate: 9,
                            duration: 3650,
                            image_url: 'https://picsum.photos/id/1048/5616/3744' }
                        ])
