Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8AB341D49
	for <lists+cluster-devel@lfdr.de>; Fri, 19 Mar 2021 13:47:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616158031;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xZRSswMAOgHVdB4a3PnSfqC1+KQpwsqkVqaX3DWk4U8=;
	b=FjloKEC2Jj3K53QtEu6VC51nqpZz3G1mdBvYTHMV3Qd3dSp3YxnKt4lGor+vQfMjfAgIgb
	hEv7T4DRMQcSUtn+mMBTnjo7aA6sMfSHvjO3HHVmjI7Gm9/HNQMJeUlomjUtdZIMJb6dJE
	O/PRDczlCbrmX+2IwcOttO0E6Zu8oU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-tKBCIyaPPXq4YMob1VKTNQ-1; Fri, 19 Mar 2021 08:47:09 -0400
X-MC-Unique: tKBCIyaPPXq4YMob1VKTNQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22A98107ACCA;
	Fri, 19 Mar 2021 12:47:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0916F369A;
	Fri, 19 Mar 2021 12:47:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 96B254BB7C;
	Fri, 19 Mar 2021 12:47:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12JCl5IY013102 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 19 Mar 2021 08:47:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 06C1B6085A; Fri, 19 Mar 2021 12:47:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00C8860C5E
	for <cluster-devel@redhat.com>; Fri, 19 Mar 2021 12:47:01 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F80E4BB7B
	for <cluster-devel@redhat.com>; Fri, 19 Mar 2021 12:47:01 +0000 (UTC)
Date: Fri, 19 Mar 2021 08:46:58 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <101686333.64767159.1616158018716.JavaMail.zimbra@redhat.com>
In-Reply-To: <451447835.64761322.1616156019951.JavaMail.zimbra@redhat.com>
References: <451447835.64761322.1616156019951.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.96, 10.4.195.2]
Thread-Topic: gfs2: fast dealloc for exhash directories
Thread-Index: RL4VacLHtZe2jaVXMOXLR1asc4R/zl4P++iN
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: fast dealloc for
	exhash	directories
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> Before this patch, whenever a directory was deleted, it called function
> __gfs2_dir_exhash_dealloc to deallocate the directory's leaf blocks.
> But __gfs2_dir_exhash_dealloc never knew if any given leaf block had
> leaf continuation aka "next" blocks, so it read every single leaf block
> in, only to determine in 99% of the cases that there was none. Still,
> this reading in of all the leaf blocks was very slow.
> 
> This patch adds a new disk flag that indicates whether a directory is
> clean of any "next leaf" blocks. If so, it takes an optimized path that
> just deletes the leaf blocks and zeroes out the hash table.
> 
> It would seem to make more sense to have the new bit indicate when a
> directory contains "next leaf" blocks rather than the inverse, but we
> need to treat file systems created by older versions of gfs2 as if
> they have "next leaf" blocks.
> 
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>

By the way, I should also mention that this new faster leaf deallocate
keeps a separate transaction and locking for each resource group affected.

The older way of deleting leaf blocks formulated an "rlist" and potentially
locked several rgrps for the duration of its entire delete.
The new algorithm only keeps one single rgrp locked at a time, thus
allowing more processes to run in parallel.

Bob

