Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC5F6932D5
	for <lists+cluster-devel@lfdr.de>; Sat, 11 Feb 2023 18:24:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676136243;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=TB2byqdECyO/QW8A+QiKJ9nfdrmoqx9YMXTJLcJScB4=;
	b=Js9WK7AUot/0yVv5hEnimgRIz/ReZnWLzW0aW8APnNuTDQHhisGYmTvnXGyj+xONgYZjTd
	2FUYSXfqldDuwh9ne+sx+mpTS6nSOiaBS50Xo41Psu3kw3OBzQ4ae0TiTAVPBayY0kmzjl
	tANNBPrOHcQW5Al5FFbvbwPbusuqnfo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-sPqPUCiNPseUg2Dif8Rexw-1; Sat, 11 Feb 2023 12:23:59 -0500
X-MC-Unique: sPqPUCiNPseUg2Dif8Rexw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C83C63C0254E;
	Sat, 11 Feb 2023 17:23:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E6482166B2A;
	Sat, 11 Feb 2023 17:23:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E96371946594;
	Sat, 11 Feb 2023 17:23:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 58FCA1946586 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 11 Feb 2023 17:23:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 95CA0492C18; Sat, 11 Feb 2023 17:23:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D9B3492C14
 for <cluster-devel@redhat.com>; Sat, 11 Feb 2023 17:23:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19DA938041C5
 for <cluster-devel@redhat.com>; Sat, 11 Feb 2023 17:23:40 +0000 (UTC)
Received: from valentin-vidic.from.hr (valentin-vidic.from.hr
 [169.150.239.92]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-536--_inEluaPQ-db8Nb2kdL3A-1; Sat, 11 Feb 2023 12:23:37 -0500
X-MC-Unique: -_inEluaPQ-db8Nb2kdL3A-1
X-Virus-Scanned: Debian amavisd-new at valentin-vidic.from.hr
Received: by valentin-vidic.from.hr (Postfix, from userid 1000)
 id 2FD9029CA0; Sat, 11 Feb 2023 18:16:46 +0100 (CET)
Date: Sat, 11 Feb 2023 18:16:46 +0100
From: Valentin =?utf-8?B?VmlkacSH?= <vvidic@debian.org>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <Y+fNfux8S615OSqd@valentin-vidic.from.hr>
References: <cd93d4eb-ac20-1ef5-3770-95bd2da2c519@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cd93d4eb-ac20-1ef5-3770-95bd2da2c519@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [ClusterLabs] gfs2-utils 3.5.0 released
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 09, 2023 at 01:12:58PM +0000, Andrew Price wrote:
> gfs2-utils contains the tools needed to create, check, modify and inspect
> gfs2 filesystems along with support scripts needed on every gfs2 cluster
> node.

Hi,

Some tests seem to be failing for the new version in Debian:

gfs2_edit tests

 37: Save/restoremeta, defaults                      FAILED (edit.at:14)
 38: Save/restoremeta, no compression                FAILED (edit.at:24)
 39: Save/restoremeta, min. block size               FAILED (edit.at:34)
 40: Save/restoremeta, 4 journals                    FAILED (edit.at:44)
 41: Save/restoremeta, min. block size, 4 journals   FAILED (edit.at:54)
 42: Save metadata to /dev/null                      ok

It seems this is all on 32-bit architectures, more info here:

https://buildd.debian.org/status/fetch.php?pkg=gfs2-utils&arch=armel&ver=3.5.0-1&stamp=1676127480&raw=0
https://buildd.debian.org/status/fetch.php?pkg=gfs2-utils&arch=armhf&ver=3.5.0-1&stamp=1676127632&raw=0
https://buildd.debian.org/status/fetch.php?pkg=gfs2-utils&arch=i386&ver=3.5.0-1&stamp=1676127477&raw=0
https://buildd.debian.org/status/fetch.php?pkg=gfs2-utils&arch=mipsel&ver=3.5.0-1&stamp=1676130593&raw=0

Can you check?

-- 
Valentin

