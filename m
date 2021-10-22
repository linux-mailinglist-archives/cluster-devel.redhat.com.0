Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 776AC4374CB
	for <lists+cluster-devel@lfdr.de>; Fri, 22 Oct 2021 11:34:30 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-CALZ906OPCeaQAM1zUhrVQ-1; Fri, 22 Oct 2021 05:34:26 -0400
X-MC-Unique: CALZ906OPCeaQAM1zUhrVQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E79C18125C0;
	Fri, 22 Oct 2021 09:34:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2FAE5D9DE;
	Fri, 22 Oct 2021 09:34:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B20A1800B9E;
	Fri, 22 Oct 2021 09:34:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19M9YBBj026805 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 22 Oct 2021 05:34:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 59D824010FE1; Fri, 22 Oct 2021 09:34:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54CC7400DAFD
	for <cluster-devel@redhat.com>; Fri, 22 Oct 2021 09:34:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B25B802A59
	for <cluster-devel@redhat.com>; Fri, 22 Oct 2021 09:34:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-325-Cqh3iWNkMdK4izXjhfEFzg-1;
	Fri, 22 Oct 2021 05:34:07 -0400
X-MC-Unique: Cqh3iWNkMdK4izXjhfEFzg-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4BE761163;
	Fri, 22 Oct 2021 09:34:03 +0000 (UTC)
Date: Fri, 22 Oct 2021 10:34:00 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YXKFiBzaBcz9EiOI@arm.com>
References: <YS40qqmXL7CMFLGq@arm.com> <YS5KudP4DBwlbPEp@zeniv-ca.linux.org.uk>
	<YWR2cPKeDrc0uHTK@arm.com>
	<CAHk-=wjvQWj7mvdrgTedUW50c2fkdn6Hzxtsk-=ckkMrFoTXjQ@mail.gmail.com>
	<YWSnvq58jDsDuIik@arm.com>
	<CAHk-=wiNWOY5QW5ZJukt_9pHTWvrJhE2=DxPpEtFHAWdzOPDTg@mail.gmail.com>
	<CAHc6FU7bpjAxP+4dfE-C0pzzQJN1p=C2j3vyXwUwf7fF9JF72w@mail.gmail.com>
	<YXE7fhDkqJbfDk6e@arm.com>
	<CAHc6FU5xTMOxuiEDyc9VO_V98=bvoDc-0OFi4jsGPgWJWjRJWQ@mail.gmail.com>
	<CAHk-=wgvnU2PXFMpsNErdwE=tXGymLHe275jWkBhCbGiixWU5g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgvnU2PXFMpsNErdwE=tXGymLHe275jWkBhCbGiixWU5g@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Josef Bacik <josef@toxicpanda.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Will Deacon <will@kernel.org>,
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

On Thu, Oct 21, 2021 at 04:30:30PM -1000, Linus Torvalds wrote:
> On Thu, Oct 21, 2021 at 4:42 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> > But probing the entire memory range in fault domain granularity in the
> > page fault-in functions still doesn't actually make sense. Those
> > functions really only need to guarantee that we'll be able to make
> > progress eventually. From that point of view, it should be enough to
> > probe the first byte of the requested memory range
> 
> That's probably fine.
> 
> Although it should be more than one byte - "copy_from_user()" might do
> word-at-a-time optimizations, so you could have an infinite loop of
> 
>  (a) copy_from_user() fails because the chunk it tried to get failed partly
> 
>  (b) fault_in() probing succeeds, because the beginning part is fine
> 
> so I agree that the fault-in code doesn't need to do the whole area,
> but it needs to at least do some <N bytes, up to length> thing, to
> handle the situation where the copy_to/from_user requires more than a
> single byte.

>From a discussion with Al some months ago, if there are bytes still
accessible, copy_from_user() is not allowed to fail fully (i.e. return
the requested copy size) even when it uses word-at-a-time. In the worst
case, it should return size - 1. If the fault_in() then continues
probing from uaddr + 1, it should eventually hit the faulty address.

The problem appears when fault_in() restarts from uaddr rather than
where copy_from_user() stopped. That's what the btrfs search_ioctl()
does. I also need to check the direct I/O cases that Andreas mentioned,
maybe they can be changed not to attempt the fault_in() from the
beginning of the block.

-- 
Catalin

