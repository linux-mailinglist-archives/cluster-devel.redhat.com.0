Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9F92140FFF0
	for <lists+cluster-devel@lfdr.de>; Fri, 17 Sep 2021 21:45:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631907916;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/bOMjTOmuGIre07c9iAeigct5z5EcPjs28HtXo1rmXM=;
	b=JWUlWzgVg8qYjHal1QeywY7CZJACmgCpag1rAc047dFi78d2A429kharjxY7eWDPNbx04m
	RzweRlDUEmTncMSELz6OEfuBQaRisz4py5JQgKgMO0W15ejoW38KK23GnCisreR1owFAbL
	bP1IWjUL44sN/2+UnayJz2cevxlo3Jg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-B3zEMPBDObCMEtQxOVSAUw-1; Fri, 17 Sep 2021 15:45:02 -0400
X-MC-Unique: B3zEMPBDObCMEtQxOVSAUw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AB679126B;
	Fri, 17 Sep 2021 19:45:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 899705D9FC;
	Fri, 17 Sep 2021 19:44:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 56B774E58F;
	Fri, 17 Sep 2021 19:44:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18HJimN3012116 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 17 Sep 2021 15:44:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9CE3760E1C; Fri, 17 Sep 2021 19:44:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 173C560CC9;
	Fri, 17 Sep 2021 19:44:42 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 17 Sep 2021 15:44:40 -0400
Message-Id: <20210917194440.4121521-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/tool] python: add bindings and test
	example
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch introduces a python directory with some python examples. This
is still in some experimental state to provide some dlm testing
framework by using libdlm.
---
 python/README                   |   7 +
 python/bindings/__init__.py     |   0
 python/bindings/dlm.py          | 244 ++++++++++++++++++++++++++++++++
 python/tests/dlm.py             |   1 +
 python/tests/recovery_interrupt |  60 ++++++++
 5 files changed, 312 insertions(+)
 create mode 100644 python/README
 create mode 100644 python/bindings/__init__.py
 create mode 100644 python/bindings/dlm.py
 create mode 120000 python/tests/dlm.py
 create mode 100755 python/tests/recovery_interrupt

diff --git a/python/README b/python/README
new file mode 100644
index 00000000..b598a53d
--- /dev/null
+++ b/python/README
@@ -0,0 +1,7 @@
+This directory contains python bindings to libdlm and short written tests in python to test dlm functionality.
+NOTE: the bindings are still experimental and only used for testing now.
+
+Future work:
+	- look into pytest
+	- add ebpf examples
+	- look into MPI for barrier()
diff --git a/python/bindings/__init__.py b/python/bindings/__init__.py
new file mode 100644
index 00000000..e69de29b
diff --git a/python/bindings/dlm.py b/python/bindings/dlm.py
new file mode 100644
index 00000000..b77d374c
--- /dev/null
+++ b/python/bindings/dlm.py
@@ -0,0 +1,244 @@
+from enum import IntEnum, IntFlag
+import sys, os, errno, platform
+import ctypes, ctypes.util
+
+#bindings
+
+if platform.system() != "Linux":
+	sys.exit("Not supported")
+
+c_path_libdlm = ctypes.util.find_library("dlm_lt")
+if not c_path_libdlm:
+	print("Unable to find the specified library.")
+	sys.exit()
+
+try:
+	c_libdlm = ctypes.CDLL(c_path_libdlm)
+except OSError:
+	print("Unable to load the system C library")
+	sys.exit()
+
+class C_DLM_LSHANDLE(ctypes.c_void_p):
+	pass
+
+class C_DLM_LKSB(ctypes.Structure):
+	_fields_ = [('sb_status', ctypes.c_int),
+		    ('sb_lkid', ctypes.c_uint32),
+		    ('sb_flags', ctypes.c_char),
+		    ('sb_lvbptr', ctypes.c_char_p)]
+
+C_BAST_CB = ctypes.CFUNCTYPE(None, ctypes.py_object)
+
+#dlm_create_lockspace
+c_dlm_create_lockspace = c_libdlm.dlm_create_lockspace
+c_dlm_create_lockspace.argtypes = [ctypes.c_char_p, #name
+				   ctypes.c_uint, #mode
+				  ]
+c_dlm_create_lockspace.restype = C_DLM_LSHANDLE
+
+#dlm_release_lockspace
+c_dlm_release_lockspace = c_libdlm.dlm_release_lockspace
+c_dlm_release_lockspace.argtypes = [ctypes.c_char_p, #name
+				    C_DLM_LSHANDLE, #ls
+				    ctypes.c_int, #force
+				   ]
+c_dlm_release_lockspace.restype = ctypes.c_int
+
+#dlm_ls_lock_wait
+c_dlm_ls_lock_wait = c_libdlm.dlm_ls_lock_wait
+c_dlm_ls_lock_wait.argtypes = [C_DLM_LSHANDLE, #ls
+			       ctypes.c_uint32, #mode
+			       ctypes.POINTER(C_DLM_LKSB), #lksb
+			       ctypes.c_uint32, #flags
+			       ctypes.c_char_p, #name
+			       ctypes.c_uint, #namelen
+			       ctypes.c_uint32, #parent
+			       ctypes.py_object, #bastarg
+			       C_BAST_CB, #bastaddr
+			       ctypes.c_void_p, #range
+			      ]
+c_dlm_ls_lock_wait.restype = ctypes.c_int
+
+#dlm_ls_unlock_wait
+c_dlm_ls_unlock_wait = c_libdlm.dlm_ls_unlock_wait
+c_dlm_ls_unlock_wait.argtypes = [C_DLM_LSHANDLE, #ls
+				 ctypes.c_uint32, #lkid
+				 ctypes.c_uint32, #flags
+				 ctypes.POINTER(C_DLM_LKSB), #lksb
+				]
+c_dlm_ls_unlock_wait.restype = ctypes.c_int
+
+#classes
+
+class LockMode(IntEnum):
+	IV = -1
+	NL = 0
+	CR = 1
+	CW = 2
+	PR = 3
+	PW = 4
+	EX = 5
+
+class LockFlag(IntFlag):
+	NOQUEUE = 0x00000001
+	CANCEL = 0x00000002
+	CONVERT = 0x00000004
+	VALBLK = 0x00000008
+	QUECVT = 0x00000010
+	IVVALBLK = 0x00000020
+	CONVDEADLK = 0x00000040
+	PERSISTENT = 0x00000080
+	NODLCKWT = 0x00000100
+	NODLCKBLK = 0x00000200
+	EXPEDITE = 0x00000400
+	NOQUEUEBAST = 0x00000800
+	HEADQUE = 0x00001000
+	NOORDER = 0x00002000
+	ORPHAN = 0x00004000
+	ALTPR = 0x00008000
+	ALTCW = 0x00010000
+	FORCEUNLOCK = 0x00020000
+	TIMEOUT = 0x00040000
+
+class LockSBFlag(IntFlag):
+	DEMOTED = 0x01
+	VALNOTVALID = 0x02
+	ALTMODE = 0x04
+
+class DLMError(OSError):
+
+	def __init__(self, errno):
+		if not errno < 0:
+			raise ValueError()
+
+		errno = abs(errno)
+		super().__init__(errno, os.strerror(errno))
+
+DLM_LOCK_TO_STR_FORMAT = \
+"""name: {}
+last_mode: {}
+last_flags: {}
+local_locked: {}
+last_sb: status: {}, lkid: {}, flags: {}, lvb: {}"""
+
+class Lockspace:
+
+	def __init__(self, name="default", mode=0o600):
+		self.__lsname = name
+		self.__ls = c_dlm_create_lockspace(self.__lsname.encode(), mode)
+		if not self.__ls:
+			raise DLMError(-errno.ENOMEM)
+
+	def release(self, force=0):
+		if not self.__ls:
+			return
+
+		rc = c_dlm_release_lockspace(self.__lsname.encode(), self.__ls,
+					     force)
+		if rc:
+			raise DLMError(rc)
+
+		self.__ls = None
+
+	def __del__(self):
+		self.release()
+
+	def __str__(self):
+		return "Lockspace: {}".format(self.__lsname)
+
+	def get_name(self):
+		return self.__lsname
+
+	# lockspace lock factory
+	def create_lock(self, name):
+		class Lock:
+
+			#note name should be 8 byte aligned for now
+			def __init__(self, ls, c_ls, name):
+				self.__local_locked = False
+				self.__last_mode = LockMode.IV
+				self.__last_flags = LockFlag(0)
+
+				self.__lk = C_DLM_LKSB()
+				self.__lk.sb_status = 0
+				self.__lk.sb_lkid = 0
+				self.__lk.sb_flags = LockSBFlag(0)
+				self.__lk.sb_lvbptr = None
+
+				self.__ls = ls
+				self.__c_ls = c_ls
+				self.__name = name
+
+			def __del__(self):
+				if self.__local_locked:
+					self.unlock_wait()
+
+			def __str__(self):
+				sb = self.get_sb()
+				return DLM_LOCK_TO_STR_FORMAT.format(
+						self.__name,
+						str(self.__last_mode),
+						str(self.__last_flags),
+						self.__local_locked,
+						str(sb.status),
+						sb.lkid, str(sb.flags),
+						str(sb.lvb))
+
+			def get_name(self):
+				return self.__name
+
+			def get_ls(self):
+				return self.__ls
+
+			# get a copy of current sb state in high-level python
+			def get_sb(self):
+				class LockSB:
+
+					def __init__(self, status, lkid,
+						     flags, lvb):
+						self.status = status
+						self.lkid = lkid
+						self.flags = LockSBFlag(flags[0])
+						self.lvb = lvb
+
+				return LockSB(self.__lk.sb_status,
+					      self.__lk.sb_lkid,
+					      self.__lk.sb_flags,
+					      self.__lk.sb_lvbptr)
+
+			def lock_wait(self, mode=LockMode.EX,
+				      flags=LockFlag(0), bast=None,
+				      bastarg=None):
+				if bast:
+					bast = C_BAST_CB(bast)
+				else:
+					bast = ctypes.cast(None, C_BAST_CB)
+
+				rc = c_dlm_ls_lock_wait(self.__c_ls, mode,
+							ctypes.byref(self.__lk),
+							flags,
+							self.__name.encode(),
+							len(self.__name), 0,
+							bastarg, bast, None)
+				if rc:
+					raise DLMError(rc)
+
+				self.__last_mode = mode
+				self.__last_flags = flags
+				self.__local_locked = True
+
+			def unlock_wait(self, flags=0):
+				rc = c_dlm_ls_unlock_wait(self.__c_ls,
+							  self.__lk.sb_lkid,
+							  flags,
+							  ctypes.byref(self.__lk))
+				if rc:
+					raise DLMError(rc)
+
+				self.__last_flags = flags
+				self.__local_locked = False
+
+		lock = Lock(self, self.__ls, name)
+		return lock
+
+# vim: tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
diff --git a/python/tests/dlm.py b/python/tests/dlm.py
new file mode 120000
index 00000000..057a99c5
--- /dev/null
+++ b/python/tests/dlm.py
@@ -0,0 +1 @@
+../bindings/dlm.py
\ No newline at end of file
diff --git a/python/tests/recovery_interrupt b/python/tests/recovery_interrupt
new file mode 100755
index 00000000..de9d2600
--- /dev/null
+++ b/python/tests/recovery_interrupt
@@ -0,0 +1,60 @@
+#!/bin/env python3
+
+from signal import signal, SIGINT
+from dlm import Lockspace
+import argparse
+import logging
+import time
+
+parser = argparse.ArgumentParser()
+
+parser.add_argument('-l', '--lock',
+		    action='store_true',
+		    help='do lock activity between ls start/stop')
+parser.add_argument('-w', '--wait',
+		    help='wait time for contention',
+		    type=int, default=1)
+parser.add_argument("-d", "--debug", default="info",
+		    help=("logging debug level"),
+		    choices=["debug", "info", "warning"])
+
+args = parser.parse_args()
+
+debug_levels = {"debug": logging.DEBUG, "info": logging.INFO, "warning": logging.WARNING}
+debug_level = debug_levels[args.debug.lower()]
+
+logging.basicConfig(level=debug_level, format="%(asctime)s:%(levelname)s: %(message)s")
+
+def handler(signal, frame):
+	global end
+	end = True
+
+signal(SIGINT, handler)
+end = False
+while not end:
+	ls = Lockspace()
+	lsname = ls.get_name()
+	logging.info("lockspace {} created".format(lsname))
+
+	if args.lock:
+		lock = ls.create_lock("fooobaar")
+		lockname = lock.get_name()
+		logging.info("lock {} created".format(lockname))
+
+		lock.lock_wait()
+		logging.info("lock {} lock()".format(lockname))
+
+		#contention
+		logging.info("lock {} wait for {} secs".format(lockname, args.wait))
+		time.sleep(args.wait)
+
+		lock.unlock_wait()
+		logging.info("lock {} unlock()".format(lockname))
+
+		del lock
+		logging.info("lock {} removed".format(lockname))
+
+	del ls
+	logging.info("lockspace {} removed".format(lsname))
+
+# vim: tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
-- 
2.27.0

