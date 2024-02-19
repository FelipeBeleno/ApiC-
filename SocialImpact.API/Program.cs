using Microsoft.EntityFrameworkCore;
using SocialImpactApp.Data;
using SocialImpactApp.Data.Models;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Configuration.AddJsonFile("appsettings.json");

// agregando dependencias y la conexion de la base de datos
builder.Services.AddDbContext<SOCIALIMPACTAPPContext>(options =>
options.UseSqlServer(builder.Configuration.GetConnectionString("APIContext"))
);



var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
