Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DBCD03D24E2
	for <lists+cluster-devel@lfdr.de>; Thu, 22 Jul 2021 15:52:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626961946;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ESge0KHDhWJ77b/8SSXjjC4o9lBAjOzbV5TN7hr2oSw=;
	b=PexjgQCioXsMrHZ6ptlm3MXG0uIEbbSitv6LGFh98jUz+7BtlnDn+ZLulThzY+p8+NQGzf
	G6fyr4kc4CdFK2yJnaiW08vD/jH2iJ0UJXFAtdfnf5YXg8lyHgFhZG8pktQ2LLHoqJy51p
	l5Dj4QDrbKzfU6IC3MC9kF8ZgIw0zKo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-hW9B59oZN-WmYxkK-XUdjw-1; Thu, 22 Jul 2021 09:52:25 -0400
X-MC-Unique: hW9B59oZN-WmYxkK-XUdjw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1116F760C1;
	Thu, 22 Jul 2021 13:52:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B4C15DA2D;
	Thu, 22 Jul 2021 13:52:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2498F4BB7C;
	Thu, 22 Jul 2021 13:52:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16MDqEja010272 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 22 Jul 2021 09:52:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8C57C2093CE2; Thu, 22 Jul 2021 13:52:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8533D2094D08
	for <cluster-devel@redhat.com>; Thu, 22 Jul 2021 13:52:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 917FF1078464
	for <cluster-devel@redhat.com>; Thu, 22 Jul 2021 13:52:11 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
	[209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-56-xH3OgPNIN--xb1EtVCV9iQ-1; Thu, 22 Jul 2021 09:52:10 -0400
X-MC-Unique: xH3OgPNIN--xb1EtVCV9iQ-1
Received: by mail-wm1-f70.google.com with SMTP id
	k5-20020a7bc3050000b02901e081f69d80so407933wmj.8
	for <cluster-devel@redhat.com>; Thu, 22 Jul 2021 06:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=ESge0KHDhWJ77b/8SSXjjC4o9lBAjOzbV5TN7hr2oSw=;
	b=LtqbH/xcEmJ+1QQrVymCmuEH4LW34SJMvzrM7hKN8RPTbYT4mpTefZF+RZmAipu4Dr
	zHW/97fd6fOtlFv13fThYRV9jZTwTneyKYWlc6XudbgU8NVUe26NgZmei5Mgm8ZNsthj
	rLmM1LU+zGtCyO142fnxPzmNP2H7IRsPtuMgUQJvT8oArwUUqtazQal2xVsNuIwt5C7W
	RPwZSBKGBgcIV1W0+QpT7yDPJ7RWqIt1Ey7TSuaIimwXw0yNK7DZVxLRC/NWbTTETG6V
	gJFRTivsLL1dplGAXHozDB7seUdhVP10/uAIb8vgKQtbMsA8M7GqG1Qtei8J8SE4Wfqx
	HxHg==
X-Gm-Message-State: AOAM531S7zFkZRpBaPn06QtkjNDonKktxldoJQgIjsjBdhvWsS2cZC/f
	61rLUmQc0il7uBrHSgrtPDPn/dBOuL5W6wizl7nJeKhLHz9HwSrJKsEXBJ4ntLxHY4QRJYYjJ+Y
	Zx4HRFkpnqYoYFF9bHjSirA==
X-Received: by 2002:a05:6000:1b0c:: with SMTP id
	f12mr48780158wrz.225.1626961928986; 
	Thu, 22 Jul 2021 06:52:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYVurwPTRb97ntwTd8UIDowdCWmKx3cnpZmclnzQMDREqVCvrbQz316b0cKwU/u4lpKBycHQ==
X-Received: by 2002:a05:6000:1b0c:: with SMTP id
	f12mr48780142wrz.225.1626961928817; 
	Thu, 22 Jul 2021 06:52:08 -0700 (PDT)
Received: from
	0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa
	(0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa.
	[2001:8b0:ffda:0:2059:8730:b2:c370])
	by smtp.gmail.com with ESMTPSA id
	c125sm3063781wme.36.2021.07.22.06.52.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 22 Jul 2021 06:52:08 -0700 (PDT)
Message-ID: <2b8e94f7a401fc98a7fce3daaa9fd63e7324e426.camel@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
To: Bob Peterson <rpeterso@redhat.com>, Andrew Morton
	<akpm@linux-foundation.org>, syzbot
	<syzbot+0d5b462a6f07447991b3@syzkaller.appspotmail.com>
Date: Thu, 22 Jul 2021 14:52:02 +0100
In-Reply-To: <302c13da-9bca-efb4-9659-6a0e9979c0bb@redhat.com>
References: <000000000000b25bb805c798a1a5@google.com>
	<20210721145801.8ca097bc1d9ad3d0018517bd@linux-foundation.org>
	<302c13da-9bca-efb4-9659-6a0e9979c0bb@redhat.com>
Organization: Red Hat UK Ltd
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-mm@kvack.org,
	syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [syzbot] WARNING in __set_page_dirty
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
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Thu, 2021-07-22 at 08:16 -0500, Bob Peterson wrote:
> On 7/21/21 4:58 PM, Andrew Morton wrote:
> > (cc gfs2 maintainers)
> > 
> > On Tue, 20 Jul 2021 19:07:25 -0700 syzbot <
> > syzbot+0d5b462a6f07447991b3@syzkaller.appspotmail.com> wrote:
> > 
> > > Hello,
> > > 
> > > syzbot found the following issue on:
> > > 
> > > HEAD commit:    d936eb238744 Revert "Makefile: Enable -Wimplicit-
> > > fallthrou..
> > > git tree:       upstream
> > > console output: 
> > > https://syzkaller.appspot.com/x/log.txt?x=1512834a300000
> > > kernel config:  
> > > https://syzkaller.appspot.com/x/.config?x=f1b998c1afc13578
> > > dashboard link: 
> > > https://syzkaller.appspot.com/bug?extid=0d5b462a6f07447991b3
> > > userspace arch: i386
> > > 
> > > Unfortunately, I don't have any reproducer for this issue yet.
> > > 
> > > IMPORTANT: if you fix the issue, please add the following tag to
> > > the commit:
> > > Reported-by: 
> > > syzbot+0d5b462a6f07447991b3@syzkaller.appspotmail.com
> > > 
> > > ------------[ cut here ]------------
> > > WARNING: CPU: 0 PID: 8696 at include/linux/backing-dev.h:283
> > > inode_to_wb include/linux/backing-dev.h:283 [inline]
> > > WARNING: CPU: 0 PID: 8696 at include/linux/backing-dev.h:283
> > > account_page_dirtied mm/page-writeback.c:2435 [inline]
> > > WARNING: CPU: 0 PID: 8696 at include/linux/backing-dev.h:283
> > > __set_page_dirty+0xace/0x1070 mm/page-writeback.c:2483
> >  
> 
> Okay, sorry for the brain fart earlier. After taking a better look, I
> know exactly what this is.
> This goes back to this discussion from April 2018:
> 
> https://listman.redhat.com/archives/cluster-devel/2018-April/msg00017.html
> 
> in which Jan Kara pointed out that:
> 
> "The problem is we really do expect mapping->host->i_mapping ==
> mapping as
> we pass mapping and inode interchangebly in the mm code. The
> address_space
> and inodes are separate structures because you can have many inodes
> pointing to one address space (block devices). However it is not
> allowed
> for several address_spaces to point to one inode!"
> The problem is that GFS2 keeps separate address spaces for its
> glocks, and they
> don't correspond 1:1 to any inode. So mapping->host is not really an
> inode for these,
> and there's really almost no relation between the glock->mapping and
> the inode it
> points to.
> 
> Even in the recent past, GFS2 did this for all metadata for both its
> media-backed glocks:
> resource groups and inodes.
> 
> I recently posted a patch set to cluster-devel ("gfs2: replace
> sd_aspace with sd_inode" -
> https://listman.redhat.com/archives/cluster-devel/2021-July/msg00066.html) in
> which
> I fixed half the problem, which is the resource group case.
> 
> Unfortunately, for inode glocks it gets a lot trickier and I haven't
> found a proper solution.
> But as I said, it's been a known issue for several years now. The
> errors only appear
> if LOCKDEP is turned on. It would be ideal if address spaces were
> treated as fully
> independent from their inodes, but no one seemed to jump on that
> idea, nor even try to
> explain why we make the assumptions Jan Kara pointed out.
> 
> In the meantime, I'll keep looking for a more proper solution. This
> won't be an easy
> thing to fix or I would have already fixed it.
> 
> Regards,
> 
> Bob Peterson
> 
> 

The reason for having address_spaces pointed to by many inodes is to
allow for stackable filesytems so that you can make the file content
available on the upper layer by just pointing the upper layer inode at
the lower layer address_space. That is presumably what Jan is thinking
of.

This however seems to be an issue with a page flag, so it isn't clear
why that would relate to the address_space? If the page is metadata
which would be the most usual case for something being unpinned, then
that page should definitely be up to date.

Looking back at the earlier rgrp fix mentioned above, the fix is not
unreasonable since there only needs to be a single inode to contain all
the rgrps. For the inode metadata that is not the case, there is a one
to one mapping between inodes and metadata address_spaces, and if the
working assumption is that multiple address_spaces per inode is not
allowed, then I think that has changed over time. I'm pretty sure that
I had checked the expectations way back when we adopted this solution,
and that there were no issues with the multiple address_spaces per
inode case. We definitely don't want to go back to adding an additional
struct inode structure (which does nothing except take up space!) to
each "real" inode in cache, because it is a big overhead in case of a
filesystem with many small files.

Still if this is only a lockdep issue, then we likely have some time to
figure out a good long term solution,

Steve.



