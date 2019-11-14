Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0A650FC726
	for <lists+cluster-devel@lfdr.de>; Thu, 14 Nov 2019 14:16:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573737409;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3DpLJy1DVx7MMqajUJ9nUQeg2dwptA0uKDG8FVjnxXw=;
	b=VaJkFpsKQ8qT7O8U2JqqW9NYVXmKVJNVyMJRHqRxod25xh4CwH5URblLvvoN7NrpgWAQHo
	GNB6ll64nBUVX1RccUVTUacSJkgkfozJ0yZFtTi1+FNtVKUpsHFRf4SucNLXObUbaBGsJK
	rSv2WD2aVpjJ0nGO3qmM0w6551Bhw0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-2rT_5qrZO1CnmZrZxKjD_g-1; Thu, 14 Nov 2019 08:16:48 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA1458C73A3;
	Thu, 14 Nov 2019 13:16:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66F537A5E5;
	Thu, 14 Nov 2019 13:16:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE86A1819ACE;
	Thu, 14 Nov 2019 13:16:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAEDGcnk015935 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 Nov 2019 08:16:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 74FAD10013D9; Thu, 14 Nov 2019 13:16:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BDDD10841A2;
	Thu, 14 Nov 2019 13:16:35 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A9CA91819AC1;
	Thu, 14 Nov 2019 13:16:35 +0000 (UTC)
Date: Thu, 14 Nov 2019 08:16:35 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <1924651997.29551613.1573737395476.JavaMail.zimbra@redhat.com>
In-Reply-To: <62e12358-40c7-85cb-ec0a-c8b103843ed0@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
	<20191113213030.237431-29-rpeterso@redhat.com>
	<62e12358-40c7-85cb-ec0a-c8b103843ed0@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.140, 10.4.195.4]
Thread-Topic: gfs2: Eliminate GFS2_RDF_UPTODATE flag in favor of buffer
	existence
Thread-Index: ECMPZaCUtXeS2M+zJImnz/TyDq9syg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH 28/32] gfs2: Eliminate GFS2_RDF_UPTODATE
 flag in favor of buffer existence
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
X-MC-Unique: 2rT_5qrZO1CnmZrZxKjD_g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

----- Original Message -----
> These are two different things... the buffer_head flags signal whether
> the buffer head is up to date with respect to what is on disk. The
> GFS2_RDF_UPTODATE flag is there to indicate whether the internal copy of
> the various fields in the resource group is up to date.
>=20
> These might match depending on how the rgrp's internal copy of the
> fields is maintained, but not sure that this is guaranteed. Has this
> been tested with the rgrplvb option? We should make sure that is all
> still working correctly,
>=20
> Steve.

You're right, and it seems obvious now.
I obviously wasn't thinking clearly when I did this. I'll eliminate this pa=
tch.

Bob

