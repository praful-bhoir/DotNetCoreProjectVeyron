Scaffold-DbContext "Name=ConnectionStrings:DefaultConnection" Microsoft.EntityFrameworkCore.SqlServer -OutputDir ".../EmployeesManagement.Domain/Entities" -ContextDir "Data" -Context "ApplicationDbContext" -Namespace "EmployeesManagement.Domain.Entities" -ContextNamespace  "EmployeesManagement.Infrastructure.Data" -NoOnConfiguring -Force 




-Project EmployeesManagement.Domain
-StartupProject EmployeesManagement.API
