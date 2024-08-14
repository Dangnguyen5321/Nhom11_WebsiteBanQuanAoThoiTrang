﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebQuanAoThoiTrang.Areas.Admin.Data
{
    public class EditTaiKhoanVM
    {
        [Display(Name = "Mã tài khoản")]
        public int IDTaiKhoan { get; set; }

        [Display(Name = "Tên người dùng")]
        [Required(ErrorMessage = "Tên người dùng là bắt buộc.")]
        [StringLength(50, ErrorMessage = "Tên người dùng không được vượt quá 50 ký tự.")]
        public string TenTK { get; set; }

        [Display(Name = "Email")]
        [Required(ErrorMessage = "Email là bắt buộc.")]
        [EmailAddress(ErrorMessage = "Email không đúng định dạng.")]
        [StringLength(100, ErrorMessage = "Email không được vượt quá 100 ký tự.")]
        public string Email { get; set; }

        [Display(Name = "Vai trò")]
        [StringLength(20, ErrorMessage = "Vai trò không được vượt quá 20 ký tự.")]
        public string VaiTro { get; set; }


        //check pass
        [StringLength(50, ErrorMessage = "Mật khẩu không được vượt quá 50 ký tự.")]
        public string NewPassword { get; set; }
        [StringLength(50, ErrorMessage = "Mật khẩu không được vượt quá 50 ký tự.")]
        public string EditPassword { get; set; }
    }
}