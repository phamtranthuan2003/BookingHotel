package com.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.admin.Booking;
import com.entity.admin.Room;
import com.entity.user.Customer;
import com.repository.BookingRepository;
import com.repository.RoomRepository;
import com.repository.CustomerRepository;

import java.time.LocalDate;
import java.util.List;
import org.springframework.ui.Model;

@Controller
@RequestMapping("/admin")
public class BookingsController {
    @Autowired
    private BookingRepository bookingRepository;
    @Autowired
    private RoomRepository roomRepository;
    @Autowired
    private CustomerRepository customerRepository;

    @GetMapping("/bookings")
    public String bookings(Model model) {
        List<Booking> bookings = bookingRepository.findAll();
        model.addAttribute("bookings", bookings);
        return "admin/booking/bookingsList";
    }
    @GetMapping("/addBooking")
    public String addBooking(Model model) {
        List<Room> rooms = roomRepository.findAll();
        List<Customer> customers = customerRepository.findAll();
        model.addAttribute("rooms", rooms);
        model.addAttribute("customers", customers);
        model.addAttribute("booking", new Booking());
        return "admin/booking/addBooking";
    }
    @PostMapping("/addBooking")
    public String addBookingSubmit(@RequestParam Long roomId,
                                   @RequestParam Long customerId,
                                   @RequestParam String checkIn,
                                   @RequestParam String checkOut,
                                   @RequestParam String status,
                                   @RequestParam String note,
                                   Model model) {
        Room room = roomRepository.findById(roomId).orElse(null);
        Customer customer = customerRepository.findById(customerId).orElse(null);
        if (room == null || customer == null) {
            model.addAttribute("error", "Phòng hoặc khách hàng không tồn tại");
            return "admin/booking/addBooking";
        }
        Booking booking = new Booking();
        booking.setRoom(room);
        booking.setCustomer(customer);
        booking.setCheckIn(LocalDate.parse(checkIn));
        booking.setCheckOut(LocalDate.parse(checkOut));
        booking.setStatus(status);
        booking.setNote(note);

        bookingRepository.save(booking);
        return "redirect:/admin/bookings";
        }
        @GetMapping("/editBooking/{id}")
        public String editBooking(@PathVariable Long id, Model model) {
            Booking booking = bookingRepository.findById(id).orElse(null);
            if (booking == null) {
                model.addAttribute("error", "Đặt phòng không tồn tại");
                return "admin/booking/bookingsList";
            }
            List<Room> rooms = roomRepository.findAll();
            List<Customer> customers = customerRepository.findAll();
            model.addAttribute("booking", booking);
            model.addAttribute("rooms", rooms);
            model.addAttribute("customers", customers);
            return "admin/booking/editBooking";
        }
    @PostMapping("/editBooking/{id}")
    public String editBookingSubmit(@PathVariable Long id,
                                    @RequestParam Long roomId,
                                    @RequestParam Long customerId,
                                    @RequestParam String checkIn,
                                    @RequestParam String checkOut,
                                    @RequestParam String status,
                                    @RequestParam String note,
                                    Model model) {
        Booking booking = bookingRepository.findById(id).orElse(null);
        if (booking == null) {
            model.addAttribute("error", "Đặt phòng không tồn tại");
            return "admin/booking/bookingsList";
        }
        Room room = roomRepository.findById(roomId).orElse(null);
        Customer customer = customerRepository.findById(customerId).orElse(null);
        if (room == null || customer == null) {
            model.addAttribute("error", "Phòng hoặc khách hàng không tồn tại");
            return "admin/booking/editBooking";
        }
        booking.setRoom(room);
        booking.setCustomer(customer);
        booking.setCheckIn(LocalDate.parse(checkIn));
        booking.setCheckOut(LocalDate.parse(checkOut));
        booking.setStatus(status);
        booking.setNote(note);

        bookingRepository.save(booking);
        return "redirect:/admin/bookings";
    }
    @GetMapping("/deleteBooking/{id}")
    public String deleteBooking(@PathVariable Long id, Model model) {
        Booking booking = bookingRepository.findById(id).orElse(null);
        if (booking == null) {
            model.addAttribute("error", "Đặt phòng không tồn tại");
            return "admin/booking/bookingsList";
        }
        bookingRepository.delete(booking);
        return "redirect:/admin/bookings";
    }
}
