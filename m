Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3862A3FA146
	for <lists+cluster-devel@lfdr.de>; Fri, 27 Aug 2021 23:51:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-auwpZjfwN7qpVIJTHIzSmw-1; Fri, 27 Aug 2021 17:51:21 -0400
X-MC-Unique: auwpZjfwN7qpVIJTHIzSmw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23B5294EE3;
	Fri, 27 Aug 2021 21:51:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 130A0399;
	Fri, 27 Aug 2021 21:51:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE7974BB7C;
	Fri, 27 Aug 2021 21:51:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17RLpH8M031371 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 17:51:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 45C832051A76; Fri, 27 Aug 2021 21:51:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 404DB2051AEE
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 21:51:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A400489B846
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 21:51:12 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-19-OQmnmiN4PXKpJMyQvpsLwg-1; Fri, 27 Aug 2021 17:51:10 -0400
X-MC-Unique: OQmnmiN4PXKpJMyQvpsLwg-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1mJjiZ-00GbUU-Au; Fri, 27 Aug 2021 21:48:55 +0000
Date: Fri, 27 Aug 2021 21:48:55 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YSldx9uhMYhT/G8X@zeniv-ca.linux.org.uk>
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-6-agruenba@redhat.com>
	<YSkz025ncjhyRmlB@zeniv-ca.linux.org.uk>
	<CAHk-=wh5p6zpgUUoY+O7e74X9BZyODhnsqvv=xqnTaLRNj3d_Q@mail.gmail.com>
	<YSk7xfcHVc7CxtQO@zeniv-ca.linux.org.uk>
	<CAHk-=wjMyZLH+ta5SohAViSc10iPj-hRnHc-KPDoj1XZCmxdBg@mail.gmail.com>
	<YSk+9cTMYi2+BFW7@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
In-Reply-To: <YSk+9cTMYi2+BFW7@zeniv-ca.linux.org.uk>
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
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 27, 2021 at 07:37:25PM +0000, Al Viro wrote:
> On Fri, Aug 27, 2021 at 12:33:00PM -0700, Linus Torvalds wrote:
> > On Fri, Aug 27, 2021 at 12:23 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> > >
> > > Could you show the cases where "partial copy, so it's OK" behaviour would
> > > break anything?
> > 
> > Absolutely.
> > 
> > For example, i t would cause an infinite loop in
> > restore_fpregs_from_user() if the "buf" argument is a situation where
> > the first page is fine, but the next page is not.
> > 
> > Why? Because __restore_fpregs_from_user() would take a fault, but then
> > fault_in_pages_readable() (renamed) would succeed, so you'd just do
> > that "retry" forever and ever.
> > 
> > Probably there are a number of other places too. That was literally
> > the *first* place I looked at.
> 
> OK...
> 
> Let me dig out the notes from the last time I looked through that area
> and grep around a bit.  Should be about an hour or two.

OK, I've dug it out and rechecked the current mainline.

Call trees:

fault_in_pages_readable()
	kvm_use_magic_page()

Broken, as per mpe.  Relevant part (see <87eeeqa7ng.fsf@mpe.ellerman.id.au> in
your mailbox back in early May for the full story):
|The current code is confused, ie. broken.
...
|We want to check that the mapping succeeded, that the address is
|readable (& writeable as well actually).
...
|diff --git a/arch/powerpc/kernel/kvm.c b/arch/powerpc/kernel/kvm.c
...
|-       if (!fault_in_pages_readable((const char *)KVM_MAGIC_PAGE, sizeof(u32))) {
|+       if (get_kernel_nofault(c, (const char *)KVM_MAGIC_PAGE)) {

	[ppc32]swapcontext()
	[ppc32]debug_setcontext()
	[ppc64]swapcontext()

Same situation in all three - it's going to kill the process if copy-in
fails, so it tries to be gentler about it and treat fault-in failures
as -EFAULT from syscall.  AFAICS, it's pointless, but I would like
comments from ppc folks.  Note that bogus *contents* of the
struct ucontext passed by user is almost certainly going to end up
with segfault; trying to catch the cases when bogus address happens
to point someplace unreadable is rather useless in that situation.

	restore_fpregs_from_user()
The one you've caught; hadn't been there last time I'd checked (back in
April).  Its counterpart in copy_fpstate_to_sigframe() had been, though.

	armada_gem_pwrite_ioctl()
Pointless, along with the access_ok() there - it does copy_from_user()
on that area shortly afterwards and failure of either is not a fast path.
	copy_page_from_iter_iovec()
Will do the right thing on short copy of any kind; we are fine with either
semantics.
	iov_iter_fault_in_readable()
		generic_perform_write()
Any short copy that had not lead to progress (== rejected by ->write_end())
will lead to next chunk shortened accordingly, so ->write_begin() would be
asked to prepare for the amount we expect to be able to copy; ->write_end()
should be fine with that.  Failure to copy anything at all (possible due to
eviction on memory pressure, etc.) leads to retry of the same chunk as the
last time, and that's where we rely on fault-in rejecting "nothing could be
faulted in" case.  That one is fine with partial fault-in reported as success.
		f2fs_file_write_iter()
Odd prealloc-related stuff.  AFAICS, from the correctness POV either variant
of semantics would do, but I'm not sure how if either is the right match
to what they are trying to do there.
		fuse_fill_write_pages()
Similar to generic_perform_write() situation, only simpler (no ->write_end()
counterpart there).  All we care about is failure if nothing could be faulted
in.
		btrfs_buffered_write()
Again, similar to generic_perform_write().  More convoluted (after a short
copy it switches to going page-by-page and getting destination pages uptodate,
which will be equivalent to ->write_end() always accepting everything it's
given from that point on), but it's the same "we care only about failure
to fault in the first page" situation.
		ntfs_perform_write()
Another generic_perform_write() analogue.  Same situation wrt fault-in
semantics.
		iomap_write_actor()
Another generic_perform_write() relative.  Same situation.


fault_in_pages_writeable()
        copy_fpstate_to_sigframe()
Same kind of "retry everything from scratch on short copy" as in the other
fpu/signal.c case.
	[btrfs]search_ioctl()
Broken with memory poisoning, for either variant of semantics.  Same for
arm64 sub-page permission differences, I think.
	copy_page_to_iter_iovec()
Will do the right thing on short copy of any kind; we are fine with either
semantics.

So we have 3 callers where we want all-or-nothing semantics - two in
arch/x86/kernel/fpu/signal.c and one in btrfs.  HWPOISON will be a problem
for all 3, AFAICS...

IOW, it looks like we have two different things mixed here - one that wants
to try and fault stuff in, with callers caring only about having _something_
faulted in (most of the users) and one that wants to make sure we *can* do
stores or loads on each byte in the affected area.

Just accessing a byte in each page really won't suffice for the second kind.
Neither will g-u-p use, unless we teach it about HWPOISON and other fun
beasts...  Looks like we want that thing to be a separate primitive; for
btrfs I'd probably replace fault_in_pages_writeable() with clear_user()
as a quick fix for now...

Comments?

