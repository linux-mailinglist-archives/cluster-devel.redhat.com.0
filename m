Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 80BFC3FCB4D
	for <lists+cluster-devel@lfdr.de>; Tue, 31 Aug 2021 18:15:30 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-_tjYf1hxMwWtUPWkaeBDgA-1; Tue, 31 Aug 2021 12:15:27 -0400
X-MC-Unique: _tjYf1hxMwWtUPWkaeBDgA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A416F1009631;
	Tue, 31 Aug 2021 16:15:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 554DB5DA2D;
	Tue, 31 Aug 2021 16:15:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A42CB181A2A5;
	Tue, 31 Aug 2021 16:15:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17VE15gg010553 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 31 Aug 2021 10:01:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1470C2141812; Tue, 31 Aug 2021 14:01:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A1602141814
	for <cluster-devel@redhat.com>; Tue, 31 Aug 2021 14:01:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A41E811E84
	for <cluster-devel@redhat.com>; Tue, 31 Aug 2021 14:01:02 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-506-Xkfvb_Q5OYO50Srfpj24iw-1;
	Tue, 31 Aug 2021 10:00:58 -0400
X-MC-Unique: Xkfvb_Q5OYO50Srfpj24iw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6989E6056B;
	Tue, 31 Aug 2021 13:54:53 +0000 (UTC)
Date: Tue, 31 Aug 2021 14:54:50 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <YS40qqmXL7CMFLGq@arm.com>
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-6-agruenba@redhat.com>
	<YSkz025ncjhyRmlB@zeniv-ca.linux.org.uk>
	<CAHk-=wh5p6zpgUUoY+O7e74X9BZyODhnsqvv=xqnTaLRNj3d_Q@mail.gmail.com>
	<YSk7xfcHVc7CxtQO@zeniv-ca.linux.org.uk>
	<CAHk-=wjMyZLH+ta5SohAViSc10iPj-hRnHc-KPDoj1XZCmxdBg@mail.gmail.com>
	<YSk+9cTMYi2+BFW7@zeniv-ca.linux.org.uk>
	<YSldx9uhMYhT/G8X@zeniv-ca.linux.org.uk>
	<YSqOUb7yZ7kBoKRY@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
In-Reply-To: <YSqOUb7yZ7kBoKRY@zeniv-ca.linux.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 31 Aug 2021 12:11:25 -0400
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	Will Deacon <will@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Josef Bacik <josef@toxicpanda.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Cluster-devel] [RFC][arm64] possible infinite loop in btrfs
	search_ioctl()
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 28, 2021 at 08:28:17PM +0100, Al Viro wrote:
> 	AFAICS, a48b73eca4ce "btrfs: fix potential deadlock in the search ioctl"
> has introduced a bug at least on arm64.
> 
> Relevant bits: in search_ioctl() we have
>         while (1) {
>                 ret = fault_in_pages_writeable(ubuf + sk_offset,
>                                                *buf_size - sk_offset);
>                 if (ret)
>                         break;
> 
>                 ret = btrfs_search_forward(root, &key, path, sk->min_transid);
>                 if (ret != 0) {
>                         if (ret > 0)
>                                 ret = 0;
>                         goto err;
>                 }
>                 ret = copy_to_sk(path, &key, sk, buf_size, ubuf,
>                                  &sk_offset, &num_found);
>                 btrfs_release_path(path);
>                 if (ret)
>                         break;
> 
>         }
> and in copy_to_sk() -
>                 sh.objectid = key->objectid;
>                 sh.offset = key->offset;
>                 sh.type = key->type;
>                 sh.len = item_len;
>                 sh.transid = found_transid;
> 
>                 /*
>                  * Copy search result header. If we fault then loop again so we
>                  * can fault in the pages and -EFAULT there if there's a
>                  * problem. Otherwise we'll fault and then copy the buffer in
>                  * properly this next time through
>                  */
>                 if (copy_to_user_nofault(ubuf + *sk_offset, &sh, sizeof(sh))) {
>                         ret = 0;
>                         goto out;
>                 }
> with sk_offset left unchanged if the very first copy_to_user_nofault() fails.
> 
> Now, consider a situation on arm64 where ubuf points to the beginning of page,
> ubuf[0] can be accessed, but ubuf[16] can not (possible with MTE, AFAICS).  We do
> fault_in_pages_writeable(), which succeeds.  When we get to copy_to_user_nofault()
> we fail as soon as it gets past the first 16 bytes.  And we repeat everything from
> scratch, with no progress made, since short copies are treated as "discard and
> repeat" here.

So if copy_to_user_nofault() returns -EFAULT, copy_to_sk() returns 0
(following commit a48b73eca4ce). I think you are right, search_ioctl()
can get into an infinite loop attempting to write to user if the
architecture can trigger faults at smaller granularity than the page
boundary. fault_in_pages_writeable() won't fix it if ubuf[0] is
writable and doesn't trigger an MTE tag check fault.

An arm64-specific workaround would be for pagefault_disable() to disable
tag checking. It's a pretty big hammer, weakening the out of bounds
access detection of MTE. My preference would be a fix in the btrfs code.

A btrfs option would be for copy_to_sk() to return an indication of
where the fault occurred and get fault_in_pages_writeable() to check
that location, even if the copying would restart from an earlier offset
(this requires open-coding copy_to_user_nofault()). An attempt below,
untested and does not cover read_extent_buffer_to_user_nofault():

diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
index 0ba98e08a029..9e74ba1c955d 100644
--- a/fs/btrfs/ioctl.c
+++ b/fs/btrfs/ioctl.c
@@ -2079,6 +2079,7 @@ static noinline int copy_to_sk(struct btrfs_path *path,
 			       size_t *buf_size,
 			       char __user *ubuf,
 			       unsigned long *sk_offset,
+			       unsigned long *fault_offset,
 			       int *num_found)
 {
 	u64 found_transid;
@@ -2143,7 +2144,11 @@ static noinline int copy_to_sk(struct btrfs_path *path,
 		 * problem. Otherwise we'll fault and then copy the buffer in
 		 * properly this next time through
 		 */
-		if (copy_to_user_nofault(ubuf + *sk_offset, &sh, sizeof(sh))) {
+		pagefault_disable();
+		ret = __copy_to_user_inatomic(ubuf + *sk_offset, &sh, sizeof(sh));
+		pagefault_enable();
+		*fault_offset = *sk_offset + sizeof(sh) - ret;
+		if (ret) {
 			ret = 0;
 			goto out;
 		}
@@ -2218,6 +2223,7 @@ static noinline int search_ioctl(struct inode *inode,
 	int ret;
 	int num_found = 0;
 	unsigned long sk_offset = 0;
+	unsigned long fault_offset = 0;

 	if (*buf_size < sizeof(struct btrfs_ioctl_search_header)) {
 		*buf_size = sizeof(struct btrfs_ioctl_search_header);
@@ -2244,8 +2250,8 @@ static noinline int search_ioctl(struct inode *inode,
 	key.offset = sk->min_offset;

 	while (1) {
-		ret = fault_in_pages_writeable(ubuf + sk_offset,
-					       *buf_size - sk_offset);
+		ret = fault_in_pages_writeable(ubuf + fault_offset,
+					       *buf_size - fault_offset);
 		if (ret)
 			break;

@@ -2256,7 +2262,7 @@ static noinline int search_ioctl(struct inode *inode,
 			goto err;
 		}
 		ret = copy_to_sk(path, &key, sk, buf_size, ubuf,
-				 &sk_offset, &num_found);
+				 &sk_offset, &fault_offset, &num_found);
 		btrfs_release_path(path);
 		if (ret)
 			break;

-- 
Catalin

