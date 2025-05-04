# from django.shortcuts import render
#
# def adminreport(request):
#
#
#     return render(request, 'report/report.html')


from django.shortcuts import render
from booking.models import Booking
from django.db.models import Count, Sum
from django.utils.timezone import now
from django.shortcuts import render
from package.models import Package
from django.db.models import Count, Sum
from django.utils.timezone import now

# def adminreport(request):
#     # Get the current year and month
#     current_year = now().year
#     current_month = now().month
#
#     # Aggregate bookings and revenue per month
#     reports = Booking.objects.filter(date__year=current_year).values('date__month').annotate(
#         total_bookings=Count('booking_id'),
#         revenue=Sum('package__amount'),
#         top_destination=Count('package__destination')  # Assuming there's a destination field
#     ).order_by('date__month')
#
#     # Format data to show month names
#     month_names = [
#         'January', 'February', 'March', 'April', 'May', 'June',
#         'July', 'August', 'September', 'October', 'November', 'December'
#     ]
#
#     report_data = []
#     # Iterate through all months up to the current month
#     for month in range(1, current_month + 1):
#         report = next((r for r in reports if r['date__month'] == month), None)
#         report_data.append({
#             'month': month_names[month - 1],
#             'total_bookings': report['total_bookings'] if report else 0,
#             'revenue': report['revenue'] if report and report['revenue'] else 0,
#             'top_destination': report['top_destination'] if report else 'N/A',
#         })
#         return render(request, 'report/report.html', {'reports': report_data})
#
#
#


from django.db.models import Count, Sum
from django.utils.timezone import now
from django.shortcuts import render
from booking.models import Booking
#
# def adminreport(request):
#     # Get the current year and month
#     current_year = now().year
#     current_month = now().month
#
#     # Aggregate bookings and revenue per month
#     reports = Booking.objects.filter(date__year=current_year).values('date__month').annotate(
#         total_bookings=Count('booking_id'),
#         revenue=Sum('package__amount')
#     ).order_by('date__month')
#
#     # Format data to show month names
#     month_names = [
#         'January', 'February', 'March', 'April', 'May', 'June',
#         'July', 'August', 'September', 'October', 'November', 'December'
#     ]
#
#     report_data = []
#     # Iterate through all months up to the current month
#     for month in range(1, current_month + 1):
#         report = next((r for r in reports if r['date__month'] == month), None)
#         report_data.append({
#             'month': month_names[month - 1],
#             'total_bookings': report['total_bookings'] if report else 0,
#             'revenue': report['revenue'] if report and report['revenue'] else 0,
#             'top_destination': 'N/A',  # Removed top destination calculation
#         })
#
#     return render(request, 'report/report.html', {'reports': report_data})


# def adminreport(request):
#     # Get the current year and month
#     current_year = now().year
#     current_month = now().month
#
#     # Aggregate bookings and revenue per month with status 'paid'
#     reports = Booking.objects.filter(date__year=current_year, status='paid').values('date__month').annotate(
#         total_bookings=Count('booking_id'),
#         revenue=Sum('package__amount'),
#         top_destination=Count('package__destination')  # Assuming there's a destination field
#     ).order_by('date__month')
#
#     # Format data to show month names
#     month_names = [
#         'January', 'February', 'March', 'April', 'May', 'June',
#         'July', 'August', 'September', 'October', 'November', 'December'
#     ]
#
#     report_data = []
#     # Iterate through all months up to the current month
#     for month in range(1, current_month + 1):
#         report = next((r for r in reports if r['date__month'] == month), None)
#         report_data.append({
#             'month': month_names[month - 1],
#             'total_bookings': report['total_bookings'] if report else 0,
#             'revenue': report['revenue'] if report and report['revenue'] else 0,
#             'top_destination': report['top_destination'] if report else 'N/A',
#         })
#     return render(request, 'report/report.html', {'reports': report_data})
#



from django.shortcuts import render
from django.db.models import Count, Sum
from django.utils.timezone import now
from booking.models import Booking

def adminreport(request):
    # Get the current year and month
    current_year = now().year
    current_month = now().month

    # Aggregate data for monthly reports
    reports = Booking.objects.filter(date__year=current_year, status='paid').values('date__month').annotate(
        total_bookings=Count('booking_id'),
        revenue=Sum('package__amount')
    ).order_by('date__month')

    # Month names for labels
    month_names = [
        'January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'
    ]

    # Prepare data for the chart
    report_data = []
    for month in range(1, current_month + 1):
        report = next((r for r in reports if r['date__month'] == month), None)
        report_data.append({
            'month': month_names[month - 1],
            'total_bookings': report['total_bookings'] if report else 0,
            'revenue': report['revenue'] if report else 0,
        })

    return render(request, 'report/report.html', {'reports': report_data})
