using System;
using System.Collections.Generic;

namespace EmployeesManagement.Domain.Entities;

public partial class Employee
{
    public int EmployeeId { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string? Email { get; set; }

    public string? PhoneNumber { get; set; }

    public int DepartmentId { get; set; }

    public decimal? Salary { get; set; }

    public DateOnly HireDate { get; set; }

    public DateTime CreatedDate { get; set; }

    public virtual Department Department { get; set; } = null!;
}
