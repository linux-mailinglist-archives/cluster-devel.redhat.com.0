Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 54CDB27AF69
	for <lists+cluster-devel@lfdr.de>; Mon, 28 Sep 2020 15:52:30 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601301149;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YE4k2pWThF1WI5QAP4ZHPvanx0t+8Sk8eygkRif+n10=;
	b=CnQORMZkbCzsBht57mSe00Y2VLgOkObipeVBmgiAK0hJOZDNvjz0abBZ3OI4m3Ic9X16PI
	LJ7KBn0LOrZJq89YmS7hd11NHLEa6twkpRA9a8KNrCpoZOk/7olX3o9vS8hCEOYsXjLZuM
	TiK8OLJBo19yuwor/xoc6Ctd5cwzixM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-iydiJxaIMe-l5MlNgmYviQ-1; Mon, 28 Sep 2020 09:52:26 -0400
X-MC-Unique: iydiJxaIMe-l5MlNgmYviQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16316801AF5;
	Mon, 28 Sep 2020 13:52:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C9E378437;
	Mon, 28 Sep 2020 13:52:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B4C3544A46;
	Mon, 28 Sep 2020 13:52:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08SDqJN8001110 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 28 Sep 2020 09:52:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6C4C160CD0; Mon, 28 Sep 2020 13:52:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9957D619B5;
	Mon, 28 Sep 2020 13:52:10 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9510644A40;
	Mon, 28 Sep 2020 13:52:10 +0000 (UTC)
Date: Mon, 28 Sep 2020 09:52:08 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Andrew Price <anprice@redhat.com>
Message-ID: <1727915046.18798145.1601301128691.JavaMail.zimbra@redhat.com>
In-Reply-To: <5da06d81-7313-288e-14bd-c3aac70dd08c@redhat.com>
References: <0000000000000fe7c205b03aa9e9@google.com>
	<5da06d81-7313-288e-14bd-c3aac70dd08c@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.68, 10.4.195.22]
Thread-Topic: general protection fault in gfs2_withdraw
Thread-Index: ubuZeyR+w1YWAGpaEZxzJkJAalPukA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com,
	syzbot <syzbot+50a8a9cf8127f2c6f5df@syzkaller.appspotmail.com>,
	syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] general protection fault in gfs2_withdraw
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> On 26/09/2020 18:21, syzbot wrote:
> > syzbot has found a reproducer for the following issue on:
> > 
> > HEAD commit:    7c7ec322 Merge tag 'for-linus' of
> > git://git.kernel.org/pub..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=11f2ff27900000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=6184b75aa6d48d66
> > dashboard link:
> > https://syzkaller.appspot.com/bug?extid=50a8a9cf8127f2c6f5df
> > compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/
> > c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=160fb773900000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1104f109900000
> > 
> > IMPORTANT: if you fix the issue, please add the following tag to the
> > commit:
> > Reported-by: syzbot+50a8a9cf8127f2c6f5df@syzkaller.appspotmail.com
> > 
> > gfs2: fsid=syz:syz.0: fatal: invalid metadata block
> >    bh = 2072 (magic number)
> >    function = gfs2_meta_indirect_buffer, file = fs/gfs2/meta_io.c, line =
> >    417
> > gfs2: fsid=syz:syz.0: about to withdraw this file system
> > general protection fault, probably for non-canonical address
> > 0xdffffc000000000e: 0000 [#1] PREEMPT SMP KASAN
> > KASAN: null-ptr-deref in range [0x0000000000000070-0x0000000000000077]
> > CPU: 0 PID: 6842 Comm: syz-executor264 Not tainted 5.9.0-rc6-syzkaller #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> > Google 01/01/2011
> > RIP: 0010:signal_our_withdraw fs/gfs2/util.c:97 [inline]
> 
> Seems that it's withdrawing in the init_inodes() path early enough
> (while looking up the jindex) that sdp->sd_jdesc is still NULL here:
> 
>    static void signal_our_withdraw(struct gfs2_sbd *sdp)
>    {
>            struct gfs2_glock *gl = sdp->sd_live_gh.gh_gl;
>            struct inode *inode = sdp->sd_jdesc->jd_inode;
> 
> I'm undecided as to whether the bug is that we're withdrawing that early
> at all, or that we're not checking for NULL there?
> 
> Probably introduced by:
> 
> 601ef0d52e96 gfs2: Force withdraw to replay journals and wait for it to
> finish
> 
> Andy

Hi Andy. Thanks for your analysis.

I suspect you're right.
It's probably another exception to the rule. We knew there would be a few of
those with 601ef0d52e96, such as the one we made for "withdrawing during withdraw".
We should probably just add a check for NULL and make it do the right thing.

Regards,

Bob Peterson

