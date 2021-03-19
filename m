Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0002A341E9F
	for <lists+cluster-devel@lfdr.de>; Fri, 19 Mar 2021 14:43:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616161429;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MnGhxyKtUKgAJcqiNIbK2oRxU1iGWEGhYv+etUFlHm0=;
	b=UUZf73DNxihcvVPZgTua4XaFEOkwR12Lv5iVARrsP7EeizTxUQ7Tv2XZ69Nm1qJXj8hKfb
	XJihC6miCOfN7EwU2L8fuNGgbzvuHav0KGtWZd//k8l1JCBteLimSeluuLqY4PcEetUa+7
	NYliiMgm2Dc4CFFGcbZ+Zqt3b9DZn6A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-DaoF9K82NTmEf3Kvg6Xw1A-1; Fri, 19 Mar 2021 09:43:47 -0400
X-MC-Unique: DaoF9K82NTmEf3Kvg6Xw1A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 254AC108BD0C;
	Fri, 19 Mar 2021 13:43:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94BAB19C79;
	Fri, 19 Mar 2021 13:43:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 394504BB7C;
	Fri, 19 Mar 2021 13:43:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12JDhgFi021519 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 19 Mar 2021 09:43:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0F95810016F8; Fri, 19 Mar 2021 13:43:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0570510013D7;
	Fri, 19 Mar 2021 13:43:42 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EFF2E1809C81;
	Fri, 19 Mar 2021 13:43:41 +0000 (UTC)
Date: Fri, 19 Mar 2021 09:43:39 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Andrew Price <anprice@redhat.com>
Message-ID: <1702394072.64772095.1616161419319.JavaMail.zimbra@redhat.com>
In-Reply-To: <2321d049-4d96-d171-b758-6dfaae803f69@redhat.com>
References: <720686359.64750132.1616155577098.JavaMail.zimbra@redhat.com>
	<2321d049-4d96-d171-b758-6dfaae803f69@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.96, 10.4.195.22]
Thread-Topic: gfs2: Add new sysfs file for gfs2 status
Thread-Index: 2VO17AiH2hXk6SrF2UptnJRCFkIamw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: Add new sysfs file for gfs2
 status
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> On 19/03/2021 12:06, Bob Peterson wrote:
> > This patch adds a new file: /sys/fs/gfs2/*/status which will report
> > the status of the file system. Catting this file dumps the current
> > status of the file system according to various superblock variables.
> > For example:
> > 
> 
> Do non-root users need access to this? I'd be more comfortable with
> 0400, following the principle of least privilege.
> 
> Andy

Hi Andy,

Non-root users do not need access. I agree and I'll change it to 400.

Bob

