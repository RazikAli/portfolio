using System; 
using System.Text.Json;

namespace PersonalFianaceTracker;

class Program {
    static List<Expense> expenses = BudgetHelper.LoadExpenses();
    static int idCounter = expenses.Count > 0 ? expenses.Max(e => e.Id) + 1 : 1;

    static void Main()
    {
        while (true)
        {
            Console.Clear();
            Console.WriteLine("=== Personal Budget Tracker ===");
            Console.WriteLine("1. Add Expense");
            Console.WriteLine("2. View Expenses");
            Console.WriteLine("3. Delete Expense");
            Console.WriteLine("4. Total Spent");
            Console.WriteLine("5. Set monthly limit and expense takeaway");
            Console.WriteLine("6. Exit");
            Console.Write("Select an option: ");

            var input = Console.ReadLine();

            switch (input)
            {
                case "1": AddExpense(); break;
                case "2": ViewExpenses(); break;
                case "3": DeleteExpense(); break;
                case "4": ShowTotal(); break;
                case "5": SetMonthlyLimit(); break;
                case "6": return;
                default: Console.WriteLine("Invalid option"); break;
            }

            Console.WriteLine("Press any key to continue...");
            Console.ReadKey();
        }
    }

    static void AddExpense()
    {
        Console.Write("Description: ");
        var desc = Console.ReadLine();

        Console.Write("Amount: ");
        decimal amt = decimal.TryParse(Console.ReadLine(), out amt) ? amt : 0;

        expenses.Add(new Expense
        {
            Id = idCounter++,
            Description = desc,
            Amount = amt,
            Date = DateTime.Now
        });

        BudgetHelper.SaveExpenses(expenses);
        Console.WriteLine("Expense added!");
    }

    static void SetMonthlyLimit()
    {
        decimal netMonthlyIncome = 0;
        var to = expenses.Sum(e => e.Amount);
        Console.WriteLine("Enter gross monthly income:");
        decimal gmi = decimal.Parse(Console.ReadLine());
        if (gmi < to){
            Console.WriteLine("you spent your monthly limit already");
        } else if (gmi > to) {
            netMonthlyIncome = gmi - to;
            Console.WriteLine(netMonthlyIncome);
        } else {
            Console.WriteLine("nothing");
        }
    }
    

    static void ViewExpenses()
    {
        Console.WriteLine("\n--- Expenses ---");
        foreach (var e in expenses)
        {
            Console.WriteLine($"{e.Id}. {e.Description} - £{e.Amount} on {e.Date:dd/MM/yyyy}");
        }
    }

    static void DeleteExpense()
    {
        ViewExpenses();
        Console.Write("Enter ID to delete: ");
        if (int.TryParse(Console.ReadLine(), out int id))
        {
            var item = expenses.FirstOrDefault(e => e.Id == id);
            if (item != null)
            {
                expenses.Remove(item);
                BudgetHelper.SaveExpenses(expenses);
                Console.WriteLine("Deleted!");
            }
            else
            {
                Console.WriteLine("ID not found.");
            }
        }
    }

    static void ShowTotal()
    {
        var total = expenses.Sum(e => e.Amount);
        Console.WriteLine($"\nTotal Spent: £{total}");
    }
}

        public static class BudgetHelper
        {
            private const string FilePath = "expenses.json";

            public static List<Expense> LoadExpenses()
            {
                if (!File.Exists(FilePath))
                    return new List<Expense>();

                var json = File.ReadAllText(FilePath);
                return JsonSerializer.Deserialize<List<Expense>>(json) ?? new List<Expense>();
            }

            public static void SaveExpenses(List<Expense> expenses)
            {
                var json = JsonSerializer.Serialize(expenses, new JsonSerializerOptions
                {
                    WriteIndented = true
                });

                File.WriteAllText(FilePath, json);
            }
        }
