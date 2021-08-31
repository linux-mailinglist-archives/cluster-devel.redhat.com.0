Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6B33FCB4C
	for <lists+cluster-devel@lfdr.de>; Tue, 31 Aug 2021 18:15:30 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-64yaNFBqMO-2wPYinscHLA-1; Tue, 31 Aug 2021 12:15:28 -0400
X-MC-Unique: 64yaNFBqMO-2wPYinscHLA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F284B802929;
	Tue, 31 Aug 2021 16:15:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFD641001281;
	Tue, 31 Aug 2021 16:15:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B59724BB7C;
	Tue, 31 Aug 2021 16:15:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17VG2D6E022183 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 31 Aug 2021 12:02:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6EB03D1BC4; Tue, 31 Aug 2021 16:02:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66F16D1BB1
	for <cluster-devel@redhat.com>; Tue, 31 Aug 2021 16:02:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AE87805903
	for <cluster-devel@redhat.com>; Tue, 31 Aug 2021 16:02:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-271-ekdZ2lOJO82mX_u96AQmQQ-1;
	Tue, 31 Aug 2021 12:02:05 -0400
X-MC-Unique: ekdZ2lOJO82mX_u96AQmQQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id B0F4160F6B;
	Tue, 31 Aug 2021 16:02:01 +0000 (UTC)
Date: Tue, 31 Aug 2021 17:01:58 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <YS5Sdi3Fflz2pn1/@arm.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 31, 2021 at 03:28:57PM +0000, Al Viro wrote:
> On Tue, Aug 31, 2021 at 02:54:50PM +0100, Catalin Marinas wrote:
> 
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

Yeah, I was too lazy to do it all and I don't have a setup to test the
patch quickly either. BTW, my hack is missing an access_ok() check.

I wonder whether copy_{to,from}_user_nofault() could actually return the
number of bytes left to copy, just like their non-nofault counterparts.
These are only used in a few places, so fairly easy to change. If we go
for a btrfs fix along the lines of my diff, it saves us from duplicating
the copy_to_user_nofault() code.

-- 
Catalin

