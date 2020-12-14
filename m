Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 84FCA2D968E
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Dec 2020 11:47:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607942833;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KgwlGTHBP3aQZAp0CBk31ZfD/uD/shPdGwpQwutWilU=;
	b=B1+oikMvEOjy5kswGW0YthuAlS4AwHl7DO7KDMC6/gTyqwmpDlrisxnCsHzLrS9XNnjTNE
	IGAT7MblS7+wDpZz2TegRLQLxkD0AEf60cMAuCJ/WY8tNuMGhAukvlzpgwttkw2hSos2Sy
	SpYA5okCsXYtmpFiDkhEwgFFjMVbPVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-HbzCkrKYPdGOMq4E5suYQw-1; Mon, 14 Dec 2020 05:47:11 -0500
X-MC-Unique: HbzCkrKYPdGOMq4E5suYQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D711B8030B9;
	Mon, 14 Dec 2020 10:47:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36C86669EB;
	Mon, 14 Dec 2020 10:47:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 241A01809C9F;
	Mon, 14 Dec 2020 10:47:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BEAkwpx025790 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 14 Dec 2020 05:46:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6E90C10074E5; Mon, 14 Dec 2020 10:46:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB86010023AD;
	Mon, 14 Dec 2020 10:46:54 +0000 (UTC)
To: Abhijith Das <adas@redhat.com>, cluster-devel <cluster-devel@redhat.com>
References: <CACrDRjiiXtz6cOO8FmnZHKte2EVKAFzDESXJ5a8oALd7h+EizA@mail.gmail.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <878be018-3ff8-5c7d-e5c6-db6513b6de1c@redhat.com>
Date: Mon, 14 Dec 2020 10:46:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CACrDRjiiXtz6cOO8FmnZHKte2EVKAFzDESXJ5a8oALd7h+EizA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] Recording extents in GFS2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

On 11/12/2020 16:38, Abhijith Das wrote:
> Hi all,
>
> With a recent set of patches, we nearly eliminated the per_node statfs
> change files by recording that info in the journal. The files and some
> recovery code remain only for backward compatibility. Similarly, I'd
> like to get rid of the per_node quota change files and record that
> info in the journal as well.
>
> I've been talking to Andreas and Bob a bit about this and I'm
> investigating how we can record extents as we allocate and deallocate
> blocks instead of writing whole blocks. I'm looking into how XFS does
> this.
>
> We could have a new journal block type that adds a list of extents to
> inodes with alloc/dealloc info. We could add in quota (uid/gid) info
> to this as well. If we can do this right, the representation of
> alloc/dealloc becomes compact and consequently we use journal space
> more efficiently. We can hopefully avoid cases where we need to zero
> out blocks during allocation as well.
>
> I'm sending this out to start a discussion and to get ideas/comments/pointers.
>
> Cheers!
> --Abhi
>
I think you need to propose something a bit more concrete. For example 
what will the data structures look like? How many entries will fit in a 
journal block at different block sizes? How will we ensure that this is 
backwards compatible? That will make it easier to have the discussions,

Steve.


