Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFFE69550B
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Feb 2023 00:52:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676332358;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=0hi1Z6audu7pzXD8dQc05kKjkQgaE5L/I/xFxWQhBEo=;
	b=hEW9vVU4c4YcsSMOFSg9vHA+6Lh4w5Kx6PoNmRZT2tibIgOv7QFf+uZ1BoQlURKvnQYlyq
	Czddc6fmEdQ3VVU6DrSsVBwwPwlI7Eonaywdv88sYUXySAUzeGdufYdbVlkVxlROdENbVa
	WWSWG4fyYDVWcAcpkZa7j7PZt9hw47w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-AVVEqESxPI6HKAb571uTeQ-1; Mon, 13 Feb 2023 18:52:35 -0500
X-MC-Unique: AVVEqESxPI6HKAb571uTeQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 009C53C10225;
	Mon, 13 Feb 2023 23:52:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C0071121319;
	Mon, 13 Feb 2023 23:52:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CC469194658F;
	Mon, 13 Feb 2023 23:52:33 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A8FD41946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 13 Feb 2023 23:52:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 98CEE4043843; Mon, 13 Feb 2023 23:52:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 910C54043840
 for <cluster-devel@redhat.com>; Mon, 13 Feb 2023 23:52:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75A3D85CBE0
 for <cluster-devel@redhat.com>; Mon, 13 Feb 2023 23:52:32 +0000 (UTC)
Received: from valentin-vidic.from.hr (valentin-vidic.from.hr
 [169.150.239.92]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-384-7IxwV_zmPou_jsgu48rYgg-1; Mon, 13 Feb 2023 18:52:30 -0500
X-MC-Unique: 7IxwV_zmPou_jsgu48rYgg-1
X-Virus-Scanned: Debian amavisd-new at valentin-vidic.from.hr
Received: by valentin-vidic.from.hr (Postfix, from userid 1000)
 id 55AFA2A5AA; Tue, 14 Feb 2023 00:52:26 +0100 (CET)
Date: Tue, 14 Feb 2023 00:52:26 +0100
From: Valentin Vidic <vvidic@debian.org>
To: Andrew Price <anprice@redhat.com>
Message-ID: <Y+rNOuCGgjPC/7Dq@valentin-vidic.from.hr>
References: <cd93d4eb-ac20-1ef5-3770-95bd2da2c519@redhat.com>
 <Y+fNfux8S615OSqd@valentin-vidic.from.hr>
 <27e6ad15-381b-12b9-3c3a-310bd886a94a@redhat.com>
 <8e04ea90-b878-878d-71d0-776867546050@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8e04ea90-b878-878d-71d0-776867546050@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: cluster-devel <cluster-devel@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 13, 2023 at 04:54:26PM +0000, Andrew Price wrote:
> It's now in main: https://pagure.io/gfs2-utils/c/a3f3aadc

Great, thank you for the quick response. Updated package is building
correctly now:

https://buildd.debian.org/status/package.php?p=gfs2-utils

-- 
Valentin

