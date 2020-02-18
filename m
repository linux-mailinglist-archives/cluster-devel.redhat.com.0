Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 416701626ED
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 14:13:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582031615;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DneqNBaeKl30A4lHYYXDk7nbntMeSJHFCdPwU3Dd7r0=;
	b=bGkzFT4MA8RCbcxQLW58KLwNSLEGqFA04KOuOGhg9VnRPiVhjNQCtCyfErpkW/w7ZZzvZR
	1ADHSpk5vAIyqbw+ifVUCN2F6gvbC/pMCqor4IIisAjQVad3dgF6NjYxVk7BnMrhLddCQh
	RuYzjOPGpymImQVFYn5B3vMjMj4EPNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-1wJn5oaVOKe2dzBi1ecGQQ-1; Tue, 18 Feb 2020 08:13:33 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D02F4107ACCA;
	Tue, 18 Feb 2020 13:13:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E2FE1BC6D;
	Tue, 18 Feb 2020 13:13:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A001335AF1;
	Tue, 18 Feb 2020 13:13:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01IDDKPl021645 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 08:13:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 44F2387056; Tue, 18 Feb 2020 13:13:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F9891BC6D;
	Tue, 18 Feb 2020 13:13:17 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7113535AF1;
	Tue, 18 Feb 2020 13:13:17 +0000 (UTC)
Date: Tue, 18 Feb 2020 08:13:17 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <1266014959.9253821.1582031597225.JavaMail.zimbra@redhat.com>
In-Reply-To: <6d7a296de025bcfed7a229da7f8cc1678944f304.1581955849.git.mchehab+huawei@kernel.org>
References: <cover.1581955849.git.mchehab+huawei@kernel.org>
	<6d7a296de025bcfed7a229da7f8cc1678944f304.1581955849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.36.116.223, 10.4.195.22]
Thread-Topic: docs: filesystems: convert gfs2.txt to ReST
Thread-Index: qxr+GACWnS4WZWTu8uqnXP6mn5UE7A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
	Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH 19/44] docs: filesystems: convert
	gfs2.txt to ReST
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
X-MC-Unique: 1wJn5oaVOKe2dzBi1ecGQQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> - Add a SPDX header;
> - Adjust document title;
> - Some whitespace fixes and new line breaks;
> - Mark literal blocks as such;
> - Add table markups;
> - Add it to filesystems/index.rst.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../filesystems/{gfs2.txt => gfs2.rst}        | 20 +++++++++++++------
>  Documentation/filesystems/index.rst           |  1 +
>  2 files changed, 15 insertions(+), 6 deletions(-)
>  rename Documentation/filesystems/{gfs2.txt => gfs2.rst} (76%)

Looks good.

Acked-by: Bob Peterson <rpeterso@redhat.com>

