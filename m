Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AB8873FA7F6
	for <lists+cluster-devel@lfdr.de>; Sun, 29 Aug 2021 00:51:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-WBDsNmDeO5m_basY5mGZiA-1; Sat, 28 Aug 2021 18:51:40 -0400
X-MC-Unique: WBDsNmDeO5m_basY5mGZiA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EEF71F2DA;
	Sat, 28 Aug 2021 22:51:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F7A95C1D5;
	Sat, 28 Aug 2021 22:51:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CDCD7181A0F2;
	Sat, 28 Aug 2021 22:51:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17SMpYEa010255 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 28 Aug 2021 18:51:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 826B6568ED; Sat, 28 Aug 2021 22:51:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D0B1568E4
	for <cluster-devel@redhat.com>; Sat, 28 Aug 2021 22:51:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80915800B28
	for <cluster-devel@redhat.com>; Sat, 28 Aug 2021 22:51:30 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-548-OtrOjhcPMvuxf50UvQetqQ-1; Sat, 28 Aug 2021 18:51:28 -0400
X-MC-Unique: OtrOjhcPMvuxf50UvQetqQ-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1mK7AL-00GuHv-Of; Sat, 28 Aug 2021 22:51:09 +0000
Date: Sat, 28 Aug 2021 22:51:09 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <YSq93XetyaUuAsY7@zeniv-ca.linux.org.uk>
References: <YSk7xfcHVc7CxtQO@zeniv-ca.linux.org.uk>
	<CAHk-=wjMyZLH+ta5SohAViSc10iPj-hRnHc-KPDoj1XZCmxdBg@mail.gmail.com>
	<YSk+9cTMYi2+BFW7@zeniv-ca.linux.org.uk>
	<YSldx9uhMYhT/G8X@zeniv-ca.linux.org.uk>
	<YSlftta38M4FsWUq@zeniv-ca.linux.org.uk>
	<20210827232246.GA1668365@agluck-desk2.amr.corp.intel.com>
	<87r1edgs2w.ffs@tglx> <YSqy+U/3lnF6K0ia@zeniv-ca.linux.org.uk>
	<YSq0mPAIBfqFC/NE@zeniv-ca.linux.org.uk>
	<YSq2WJindB0pJPRb@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
In-Reply-To: <YSq2WJindB0pJPRb@zeniv-ca.linux.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, "Luck,
	Tony" <tony.luck@intel.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, x86@kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Borislav Petkov <bp@alien8.de>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 05/19] iov_iter: Introduce
	fault_in_iov_iter_writeable
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 28, 2021 at 10:19:04PM +0000, Al Viro wrote:

> How about taking __clear_user() out of copy_fpregs_to_sigframe()
> and replacing the call of fault_in_pages_writeable() with
> 	if (!clear_user(buf_fx, fpu_user_xstate_size))
> 		goto retry;
> 	return -EFAULT;
> in the caller?

Something like this (completely untested)

Lift __clear_user() out of copy_fpregs_to_sigframe(), do not confuse EFAULT with
X86_TRAP_PF, don't bother with fault_in_pages_writeable() (pointless, since now
__clear_user() on error is not under pagefault_disable()).  And don't bother
with retries on anything other than #PF...

diff --git a/arch/x86/include/asm/fpu/internal.h b/arch/x86/include/asm/fpu/internal.h
index 5a18694a89b2..71c6621a262f 100644
--- a/arch/x86/include/asm/fpu/internal.h
+++ b/arch/x86/include/asm/fpu/internal.h
@@ -17,6 +17,7 @@
 #include <linux/mm.h>
 
 #include <asm/user.h>
+#include <asm/trapnr.h>
 #include <asm/fpu/api.h>
 #include <asm/fpu/xstate.h>
 #include <asm/fpu/xcr.h>
@@ -345,7 +346,7 @@ static inline int xsave_to_user_sigframe(struct xregs_state __user *buf)
 	 */
 	err = __clear_user(&buf->header, sizeof(buf->header));
 	if (unlikely(err))
-		return -EFAULT;
+		return -X86_TRAP_PF;
 
 	stac();
 	XSTATE_OP(XSAVE, buf, lmask, hmask, err);
diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
index 445c57c9c539..611b9ed9c06b 100644
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@ -135,18 +135,12 @@ static inline int save_xstate_epilog(void __user *buf, int ia32_frame)
 
 static inline int copy_fpregs_to_sigframe(struct xregs_state __user *buf)
 {
-	int err;
-
 	if (use_xsave())
-		err = xsave_to_user_sigframe(buf);
-	else if (use_fxsr())
-		err = fxsave_to_user_sigframe((struct fxregs_state __user *) buf);
+		return xsave_to_user_sigframe(buf);
+	if (use_fxsr())
+		return fxsave_to_user_sigframe((struct fxregs_state __user *) buf);
 	else
-		err = fnsave_to_user_sigframe((struct fregs_state __user *) buf);
-
-	if (unlikely(err) && __clear_user(buf, fpu_user_xstate_size))
-		err = -EFAULT;
-	return err;
+		return fnsave_to_user_sigframe((struct fregs_state __user *) buf);
 }
 
 /*
@@ -205,9 +199,10 @@ int copy_fpstate_to_sigframe(void __user *buf, void __user *buf_fx, int size)
 	fpregs_unlock();
 
 	if (ret) {
-		if (!fault_in_pages_writeable(buf_fx, fpu_user_xstate_size))
+		if (!__clear_user(buf_fx, fpu_user_xstate_size) &&
+		    ret == -X86_TRAP_PF)
 			goto retry;
-		return -EFAULT;
+		return -1;
 	}
 
 	/* Save the fsave header for the 32-bit frames. */
@@ -275,7 +270,7 @@ static int restore_fpregs_from_user(void __user *buf, u64 xrestore,
 		fpregs_unlock();
 
 		/* Try to handle #PF, but anything else is fatal. */
-		if (ret != -EFAULT)
+		if (ret != -X86_TRAP_PF)
 			return -EINVAL;
 
 		ret = fault_in_pages_readable(buf, size);

