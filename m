Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8381542960A
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Oct 2021 19:47:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-4SyogEhsMH2z6U7U40YK3g-1; Mon, 11 Oct 2021 13:47:27 -0400
X-MC-Unique: 4SyogEhsMH2z6U7U40YK3g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 001A018A0728;
	Mon, 11 Oct 2021 17:47:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD1975C232;
	Mon, 11 Oct 2021 17:47:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE50B4E58F;
	Mon, 11 Oct 2021 17:47:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19BHl9oT019186 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Oct 2021 13:47:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 95F162166B2D; Mon, 11 Oct 2021 17:47:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90E6A2166B25
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 17:47:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6957811E76
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 17:47:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-568-FsEyIGi2NT-MpkZTbK4CdQ-1;
	Mon, 11 Oct 2021 13:47:05 -0400
X-MC-Unique: FsEyIGi2NT-MpkZTbK4CdQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A26E60560;
	Mon, 11 Oct 2021 17:37:56 +0000 (UTC)
Date: Mon, 11 Oct 2021 18:37:52 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <YWR2cPKeDrc0uHTK@arm.com>
References: <20210827164926.1726765-6-agruenba@redhat.com>
	<YSkz025ncjhyRmlB@zeniv-ca.linux.org.uk>
	<CAHk-=wh5p6zpgUUoY+O7e74X9BZyODhnsqvv=xqnTaLRNj3d_Q@mail.gmail.com>
	<YSk7xfcHVc7CxtQO@zeniv-ca.linux.org.uk>
	<CAHk-=wjMyZLH+ta5SohAViSc10iPj-hRnHc-KPDoj1XZCmxdBg@mail.gmail.com>
	<YSk+9cTMYi2+BFW7@zeniv-ca.linux.org.uk>
	<YSldx9uhMYhT/G8X@zeniv-ca.linux.org.uk>
	<YSqOUb7yZ7kBoKRY@zeniv-ca.linux.org.uk> <YS40qqmXL7CMFLGq@arm.com>
	<YS5KudP4DBwlbPEp@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
In-Reply-To: <YS5KudP4DBwlbPEp@zeniv-ca.linux.org.uk>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 31, 2021 at 03:28:57PM +0000, Al Viro wrote:
> On Tue, Aug 31, 2021 at 02:54:50PM +0100, Catalin Marinas wrote:
> > An arm64-specific workaround would be for pagefault_disable() to disable
> > tag checking. It's a pretty big hammer, weakening the out of bounds
> > access detection of MTE. My preference would be a fix in the btrfs code.
> > 
> > A btrfs option would be for copy_to_sk() to return an indication of
> > where the fault occurred and get fault_in_pages_writeable() to check
> > that location, even if the copying would restart from an earlier offset
> > (this requires open-coding copy_to_user_nofault()). An attempt below,
> > untested and does not cover read_extent_buffer_to_user_nofault():
> 
> Umm...  There's another copy_to_user_nofault() call in the same function
> (same story, AFAICS).

I cleaned up this patch [1] but I realised it still doesn't solve it.
The arm64 __copy_to_user_inatomic(), while ensuring progress if called
in a loop, it does not guarantee precise copy to the fault position. The
copy_to_sk(), after returning an error, starts again from the previous
sizeof(sh) boundary rather than from where the __copy_to_user_inatomic()
stopped. So it can get stuck attempting to copy the same search header.

An ugly fix is to fall back to byte by byte copying so that we can
attempt the actual fault address in fault_in_pages_writeable().

If the sh being recreated in copy_to_sk() is the same on the retried
iteration, we could use an *sk_offset that is not a multiple of
sizeof(sh) in order to have progress. But it's not clear to me whether
the data being copied can change once btrfs_release_path() is called.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=devel/btrfs-fix

-- 
Catalin

