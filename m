Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8A03FAE3C
	for <lists+cluster-devel@lfdr.de>; Sun, 29 Aug 2021 21:52:02 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-fcNKhl-hMyeh6ji8UcFNqw-1; Sun, 29 Aug 2021 15:51:49 -0400
X-MC-Unique: fcNKhl-hMyeh6ji8UcFNqw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BAA2108292A;
	Sun, 29 Aug 2021 19:51:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48D13189C7;
	Sun, 29 Aug 2021 19:51:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BBB5C4BB7C;
	Sun, 29 Aug 2021 19:51:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17TJpcWj007599 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 29 Aug 2021 15:51:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EA34D4411C; Sun, 29 Aug 2021 19:51:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E527444109
	for <cluster-devel@redhat.com>; Sun, 29 Aug 2021 19:51:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A711E185A7A4
	for <cluster-devel@redhat.com>; Sun, 29 Aug 2021 19:51:34 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-23-Q8UqzcTCMxm8Pcf0Gx9UnQ-1; Sun, 29 Aug 2021 15:51:32 -0400
X-MC-Unique: Q8UqzcTCMxm8Pcf0Gx9UnQ-1
From: Thomas Gleixner <tglx@linutronix.de>
To: Al Viro <viro@zeniv.linux.org.uk>
In-Reply-To: <YSvj/ML2saV3+5Ru@zeniv-ca.linux.org.uk>
References: <YSk+9cTMYi2+BFW7@zeniv-ca.linux.org.uk>
	<YSldx9uhMYhT/G8X@zeniv-ca.linux.org.uk>
	<YSlftta38M4FsWUq@zeniv-ca.linux.org.uk>
	<20210827232246.GA1668365@agluck-desk2.amr.corp.intel.com>
	<87r1edgs2w.ffs@tglx> <YSqy+U/3lnF6K0ia@zeniv-ca.linux.org.uk>
	<YSq0mPAIBfqFC/NE@zeniv-ca.linux.org.uk>
	<YSq2WJindB0pJPRb@zeniv-ca.linux.org.uk>
	<YSq93XetyaUuAsY7@zeniv-ca.linux.org.uk> <87k0k4gkgb.ffs@tglx>
	<YSvj/ML2saV3+5Ru@zeniv-ca.linux.org.uk>
Date: Sun, 29 Aug 2021 21:51:29 +0200
Message-ID: <87h7f8ghby.ffs@tglx>
MIME-Version: 1.0
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
	Tony" <tony.luck@intel.com>, Jan Kara <jack@suse.cz>, Borislav, "Darrick J.
	Wong" <djwong@kernel.org>, x86@kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Petkov <bp@alien8.de>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Sun, Aug 29 2021 at 19:46, Al Viro wrote:

> On Sun, Aug 29, 2021 at 08:44:04PM +0200, Thomas Gleixner wrote:
>> On Sat, Aug 28 2021 at 22:51, Al Viro wrote:
>> > @@ -345,7 +346,7 @@ static inline int xsave_to_user_sigframe(struct xregs_state __user *buf)
>> >  	 */
>> >  	err = __clear_user(&buf->header, sizeof(buf->header));
>> >  	if (unlikely(err))
>> > -		return -EFAULT;
>> > +		return -X86_TRAP_PF;
>> 
>> This clear_user can be lifted into copy_fpstate_to_sigframe(). Something
>> like the below.
>
> Hmm...  This mixing of -X86_TRAP_... with -E... looks like it's asking for
> trouble in general.  Might be worth making e.g. fpu__restore_sig() (and
> its callers) return bool, seeing that we only check for 0/non-zero in
> there.

Let me fix that.

