struct Transaction {
    var title: String
    var amount: Int
    var category: Category
    var type: TransactionType
}

enum TransactionType{
    case income
    case expense
}

enum Category {
    case food
    case transport
    case shopping
    case other
}

class Account {
    var name: String
    var balance: Int
    var transactions: [Transaction] = []
    
    init(name: String, balance: Int) {
        self.name = name
        self.balance = balance
    }
    
    func addTransaction(transaction: Transaction) {
        transactions.append(transaction)
    }
    
    func calculateCurrentBalance() -> Int {
        var current = balance
        for i in transactions {
            if i.type == .income {
                current = current + i.amount
            } else {
                current = current - i.amount
            }
        }
        return current
    }
    
    func calculateTotalIncome() -> Int {
        var total = 0
        for i in transactions {
            if i.type == .income {
                total = total + i.amount
            }
        }
        return total
    }
    
    func calculateTotalExpense() -> Int {
        var total = 0
        for i in transactions {
            if i.type == .expense {
                total = total + i.amount
            }
        }
        return total
    }
}




