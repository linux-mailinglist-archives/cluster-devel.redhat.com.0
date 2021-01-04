Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB132E9A1A
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Jan 2021 17:09:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609776586;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Tcd5kt0xkgDAzW+l6wYH3ODFkGsnd/JEJ9MQRxVzW8E=;
	b=SO/0+4Kbs0AuP8yZCodLPc61z5YXjgIY3jqgvsTPAVzft8NmvxIDgo3jea/NXcyJ79oPpS
	cCvdC000Y7fAOwIpbcZK+MrvsCy5tqyLTs0dnV7pKXh/yOcpFMhowaWYI8w9iTW3E9xx1U
	2IvCHIeV4H6thFoW6G3b2MvdGHUESOc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-rczR6CqgPLSMm2qXq9AbuA-1; Mon, 04 Jan 2021 11:09:44 -0500
X-MC-Unique: rczR6CqgPLSMm2qXq9AbuA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 585AFC299;
	Mon,  4 Jan 2021 16:09:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77E9E60BFA;
	Mon,  4 Jan 2021 16:09:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20CFE180954D;
	Mon,  4 Jan 2021 16:09:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 104G9TFt005856 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 4 Jan 2021 11:09:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B205B271AB; Mon,  4 Jan 2021 16:09:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA5FDE147;
	Mon,  4 Jan 2021 16:09:26 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7EB624BB40;
	Mon,  4 Jan 2021 16:09:26 +0000 (UTC)
Date: Mon, 4 Jan 2021 11:09:24 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <561946972.42407585.1609776564024.JavaMail.zimbra@redhat.com>
In-Reply-To: <51252ca2-fa56-acb8-24cf-fb2e992f76de@redhat.com>
References: <2125295377.38904313.1608669538740.JavaMail.zimbra@redhat.com>
	<51252ca2-fa56-acb8-24cf-fb2e992f76de@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.52, 10.4.195.1]
Thread-Topic: gfs2: make recovery workqueue operate on a gfs2 mount point,
	not journal
Thread-Index: 7LK3oDG76bkOrb8MT/gKyjb3EgzANg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: make recovery workqueue
 operate on a gfs2 mount point, not journal
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

----- Original Message -----
> Hi,
> 
> On 22/12/2020 20:38, Bob Peterson wrote:
> > Hi,
> >
> > Before this patch, journal recovery was done by a workqueue function that
> > operated on a per-journal basis. The problem is, these could run
> > simultaneously
> > which meant that they could all use the same bio, sd_log_bio, to do their
> > writing to all the various journals. These operations overwrote one another
> > eventually causing memory corruption.
> 
> Why not just add more bios so that this issue goes away? It would make
> more sense than preventing recovery from running in parallel. In general
> recovery should be spread amoung nodes anyway, so the case of having
> multiple recoveries running on the same node in parallel should be
> fairly rare too,
> 
> Steve.

As I understand it, if we allocate a bio from the same bio_set (as bio_alloc does)
we need to submit the previous bio before getting the next one, which means
recovery processes cannot work in parallel, even if they use different bio pointers.

We can, of course, allocate several bio_sets, one for each journal, but I
remember Jeff Moyer telling me it would use 1MB per bio_set of memory,
which seems high. (I've not verified that.) I'm testing up to 60 mounts
times 5 cluster nodes (5 journals) which would add up to 300MB of memory.
That's not horrible but I remember we decided not to allocate separate
per-mount rb_trees for glock indexing because of the memory needed, and 
that seems much less by comparison.

We could also introduce new locking (and multiple bio pointers) to prevent
the bio from being used by multiple recoveries at the same time. I actually
tried that on an earlier attempt and immediately ran into deadlock issues,
probably because our journal writes also use the same bio.

This way is pretty simple and there are fewer recovery processes to worry
about when analyzing vmcores.

Bob

