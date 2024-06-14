<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );
?>

<tr bgcolor="#FFCC00">
<td colspan="6">
<ul id="nav" class="dropdown dropdown-horizontal">
	<li><a href="./" class="dir">ตั้งค่าระบบ</a>
		<ul>
			<li><a href="?file=office_name">ชื่อหน่วยงาน</a></li>
			<li><a href="?file=workgroup">กลุ่ม(งาน)ในองค์กร</a></li>
			<li><a href="?file=menugroup">กลุ่มระบบงานย่อย(menu)</a></li>
			<li><a href="?file=school_group">กลุ่มสถานศึกษา</a></li>
			<li><a href="?file=school">สถานศึกษา</a></li>
			<li><a href="?file=school_detail">รายละเอียดสถานศึกษา(เพิ่มเติม)</a></li>
		</ul>
	</li>
	<li><a href="./" class="dir">ระบบงานย่อย</a>
		<ul>
			<li><a href="?file=module">ระบบงานย่อย(Module)</a></li>
			<li><a href="?file=module_admin">ผู้ดูแล(Admin)ระบบงานย่อย</a></li>
		</ul>
	</li>
	<li><a href="./" class="dir">การเชื่อมกับระบบต่าง ๆ</a>
		<ul>
			<li><a href="?file=sync_code">เชื่อมกับ SMART OBEC</a></li>
			<li><a href="?file=smss_permission">เปิดสิทธิ์ให้ SMSS</a></li>
			<li><a href="?file=sync_smss_code">เชื่อมกับ SMSS</a></li>
		</ul>
	</li>
	<li><a href="./" class="dir">การส่งต่อข้อมูล</a>
		<ul>
			<li><a href="?file=data_requester">ผู้ขอข้อมูลจากAMSS++</a></li>
			<li><a href="?file=data_requester_log">รายงานการให้บริการข้อมูล</a></li>	
		</ul>
	</li>
	<li><a href="./" class="dir">ลงทะเบียน</a>
		<ul>
			<li><a href="?file=register">ลงทะเบียนการใช้ AMSS++</a></li>
		</ul>
	</li>
	<li><a href="./" class="dir">ผู้ใช้ (User)</a>
		<ul>
			<li><a href="?file=user_change_pwd">เปลี่ยนรหัสผ่านตนเอง</a></li>
			<li><a href="?file=add_user">เพิ่ม แก้ไข ผู้ใช้(User) ระดับ สพท.</a></li>
			<li><a href="?file=add_user_sch">เพิ่ม แก้ไข ผู้ใช้(User) ระดับ สถานศึกษา</a></li>
		</ul>
	</li>
	<li><a href="./" class="dir">คู่มือ</a>
		<ul>
			<li><a href='section/default/manual/amssplus_1.pdf' target='_blank'>คู่มือ AMSS++ </a></li>
			<li><a href='section/default/manual/amssplus_manual.pdf' target='_blank'>คู่มือ AMSS++ ส่วนจัดการระบบ</a></li>
		</ul>
	</li>
</ul>
</td>
</tr>
