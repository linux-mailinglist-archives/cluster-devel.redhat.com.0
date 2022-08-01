Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B24B586DE4
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Aug 2022 17:38:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659368327;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=b8eKRy3g11ioTTuIDRpimxoFALRtFmTHxY4IpUGDgIw=;
	b=SCc7Ydw6E8HExjQ2Od7AFM6bfUkWCliXXjeZzbyTF7cfHHU8ny3axdXdInzgMV9BRNjyq6
	G9dcxXDgR8WzH3ig1l7MddK2h2OCDkepsdEIZx+UjrtcGUVcnAZhsPkz8403oGu9u/0uOg
	CX5+hFVx+i3LYWaaeSbiUUu7guBQUrg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-mhB3HT6YM4-HXMm2I3pfzw-1; Mon, 01 Aug 2022 11:38:43 -0400
X-MC-Unique: mhB3HT6YM4-HXMm2I3pfzw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 078C28037A9;
	Mon,  1 Aug 2022 15:38:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E933492CA2;
	Mon,  1 Aug 2022 15:38:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8E1A31946A4D;
	Mon,  1 Aug 2022 15:38:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 961D71946A40 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  1 Aug 2022 15:31:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 87D2A2026D07; Mon,  1 Aug 2022 15:31:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83C182026D64
 for <cluster-devel@redhat.com>; Mon,  1 Aug 2022 15:31:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68702811E76
 for <cluster-devel@redhat.com>; Mon,  1 Aug 2022 15:31:54 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-FVAJHCdSMQGZnjkNmjI37A-1; Mon, 01 Aug 2022 11:31:52 -0400
X-MC-Unique: FVAJHCdSMQGZnjkNmjI37A-1
Received: by mail-qt1-f177.google.com with SMTP id l14so8275543qtv.4
 for <cluster-devel@redhat.com>; Mon, 01 Aug 2022 08:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=b8eKRy3g11ioTTuIDRpimxoFALRtFmTHxY4IpUGDgIw=;
 b=uplIpdgMnZPGFtqZhNyn7ydUQ9GzoMSVJjrB1M3vCDCu3Id8xYHkMJnyJoNIt6Kr4S
 B4ryfAwlasSv/l2cLXCMCPzpU4EFPKKIbCc6i1hQjKWKBhkXiHbi1TtITdkqzwFMEFk/
 U0xl3wsA2SJVpERhL+GBAaJbsw98pceZKLeAdKOZHG0/Mmzw1uwQ/nbpYekNihhqAm7H
 AE36BQcUZHcKEoJ4Bi5/ETrI2w7oAzqWkTLdk0p5eZyMzrmLeCFzsXKWRhw7GYNGN3lk
 6SjGLJf7TaOW+GfinZjhCK1hiUJPf76m7rIX3uV4TN5gRtx9CHfGD4rCo0RWOxG2cqfH
 G9Fg==
X-Gm-Message-State: AJIora9XdDnOME/ZR+0dIi8+bkuFIbq8pXjFLp0h858uezV9dr9dBA99
 cR955FBHikAYgLhht/iMLnl5nw==
X-Google-Smtp-Source: AGRyM1vXWP/IvVdz9h7ZSPwp5oBBTw3kGf28P7hqbodtJE91QbR8pRw9BoRmFvjH6p+BSxlNYcGIzw==
X-Received: by 2002:ac8:5e07:0:b0:31f:73:1394 with SMTP id
 h7-20020ac85e07000000b0031f00731394mr14655440qtx.502.1659367911431; 
 Mon, 01 Aug 2022 08:31:51 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::ad0f])
 by smtp.gmail.com with ESMTPSA id
 z1-20020ac84541000000b0031f338f95c0sm7391385qtn.0.2022.08.01.08.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 08:31:51 -0700 (PDT)
Date: Mon, 1 Aug 2022 11:31:50 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <Yufx5jpyJ+zcSJ4e@cmpxchg.org>
References: <20220719041311.709250-1-hch@lst.de>
 <20220728111016.uwbaywprzkzne7ib@quack3>
 <20220729092216.GE3493@suse.de> <20220729141145.GA31605@lst.de>
MIME-Version: 1.0
In-Reply-To: <20220729141145.GA31605@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mailman-Approved-At: Mon, 01 Aug 2022 15:38:01 +0000
Subject: Re: [Cluster-devel] remove iomap_writepage v2
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
 "Darrick J. Wong" <djwong@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, Mel Gorman <mgorman@suse.de>,
 Johannes Thumshirn <jth@kernel.org>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 29, 2022 at 04:11:45PM +0200, Christoph Hellwig wrote:
> On Fri, Jul 29, 2022 at 10:22:16AM +0100, Mel Gorman wrote:
> > There is some context missing because it's not clear what the full impact is
> > but it is definitly the case that writepage is ignored in some contexts for
> > common filesystems so lets assume that writepage from reclaim context always
> > failed as a worst case scenario. Certainly this type of change is something
> > linux-mm needs to be aware of because we've been blind-sided before.
> 
> Between willy and Johannes pushing or it I was under the strong assumption
> that linux-mm knows of it..

Yes, the context was an FS session at LSFMM. FS folks complained about
the MM relying on single-page writeouts. On the MM side we've invested
a lot into eliminating this dependency over the last decade or so, and
I would argue it's gone today. But the calls are still in the code,
and so FS folks continue to operate under the old assumption. You
can't blame them. I suggested we remove the callbacks to clarify
things and eliminate that murky corner from the FS/MM interface.

Compaction/migration is easy. It simply never calls writepage when
there is a migratepage callback - which major filesystems have.

Reclaim may still call it, but the invocation rules are so restrictive
nowadays that it's unlikely to actually help when it matters (and we
know it makes things worse in many cases).

For example, cgroup reclaim isn't ever allowed to call writepage.
This covers the small system scenario.

Whether writepage helps under OOM is not clear. OOMing systems tend to
have thundering herds of direct reclaimers, any one of which can
declare OOM if they fail, yet none of them can write pages. They
already rely on another thread to make progress. That thread can be
the flushers writing in offset order, or kswapd writing in LRU
order. You could argue that LRU order, while less efficient IO,
launders pages closer to the scanner. From an OOM perspective that
doesn't matter, though, because scanners will work through the entire
LRU list several times before giving up. They won't miss flusher
progress. That leaves reclaim efficiency - having to scan fewer pages
before potentially finding clean ones. But it's an IO bound scenario,
so arguably efficient IO would seem more important than efficient CPU.

The risk of this change, IMO, is exposing reclaim to flat out bugs in
the flusher code, or bugs in the code that matches reclaim to flushing
speed. However, a) cgroup has been relying on those for a decade. And
b) we've been treating writepage calls like bugs due to the latency
they inject into workloads, and tuned the MM to rely more on flushers
(e.g. c55e8d035b28 ("mm: vmscan: move dirty pages out of the way until
they're flushed")). So we know this stuff works at scale and with real
workloads. I think the risk of dragons there is quite low.

XFS hasn't had a ->writepage call for a while. After LSF I internally
tested dropping btrfs' callback, and the results looked good: no OOM
kills with dirty/writeback pages remaining, performance parity. Then I
went on vacation and Christoph beat me to the patch :)

I think it's a really good cleanup that makes things cleaner and more
predictable in both the fs and the mm.

> > I don't think it would be incredibly damaging although there *might* be
> > issues with small systems or cgroups. 
> 
> Johannes specifically mentioned that cgroup writeback will never call
> into ->writepage anyway.

Yes, cgroup has relied on the flushers since

commit ee72886d8ed5d9de3fa0ed3b99a7ca7702576a96
Author: Mel Gorman <mel@csn.ul.ie>
Date:   Mon Oct 31 17:07:38 2011 -0700

    mm: vmscan: do not writeback filesystem pages in direct reclaim

since cgroup reclaim == direct reclaim.

