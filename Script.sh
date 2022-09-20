#!/bin/bash
FileName=${0##*/}
filename=${FileName%.*}
mkdir $filename
cd $filename
dotnet new mvc -o $filename
cd ./
dotnet new sln --name $filename
dotnet sln $filename.sln add ./$filename/$filename.csproj 
cd $filename
dotnet add package Microsoft.EntityFrameworkCore.Tools
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
cd Models
echo "public class Product
{
  public int ProductId {get;set;}
  
}" >> Product.cs

echo "public class Category
{
  public int CategoryId {get;set;}
  public string CategoryName {get;set;}
  public string CategoryDescription {get;set;}
}" >> Category.cs
