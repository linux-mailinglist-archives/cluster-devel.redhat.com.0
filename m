Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A2ED725CFAD
	for <lists+cluster-devel@lfdr.de>; Fri,  4 Sep 2020 05:13:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599189221;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nWf9+WpCEGI3ergnA/DyKAUXRnMH1rIrLazPiX6U0rc=;
	b=eop3PDpG3/aXx9YP+HGkjIykP+/ssY6ZpFCaELzDGz0a4pb5lotDNisA9SZSTz0NzTdSiu
	ZQ69mu5VUnvnWB1pZCgSv03MxkpIdgqn0840UAW7D+nGaFqXjnRBJRkbPewshc3xG63tg5
	MIrD2BnMAJdl+L5o4dA+DGeZhsh3d/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-ulJR2xirNNuQCCX0hA0mZA-1; Thu, 03 Sep 2020 23:13:24 -0400
X-MC-Unique: ulJR2xirNNuQCCX0hA0mZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97C14801AF0;
	Fri,  4 Sep 2020 03:13:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F5B4196FD;
	Fri,  4 Sep 2020 03:13:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F23E679DD6;
	Fri,  4 Sep 2020 03:13:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0843DDk2028773 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 23:13:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1F0B45D9D2; Fri,  4 Sep 2020 03:13:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.138] (unknown [10.33.36.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3BEA45D9CC;
	Fri,  4 Sep 2020 03:13:09 +0000 (UTC)
To: =?UTF-8?Q?Valentin_Vidi=c4=87?= <vvidic@debian.org>
References: <b1234ece-f35b-f77a-32c1-f8d351ae48a6@redhat.com>
	<20200903223932.GK8773@valentin-vidic.from.hr>
From: Andrew Price <anprice@redhat.com>
Message-ID: <06377e85-04f1-d828-9e75-d81629fcd59c@redhat.com>
Date: Fri, 4 Sep 2020 04:13:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200903223932.GK8773@valentin-vidic.from.hr>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [ClusterLabs] gfs2-utils 3.3.0 released
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 03/09/2020 23:39, Valentin Vidić wrote:
> Hi, it seems some tests fail during ARM build:
> 
> gfs2_edit tests
> 
>   31: Save/restoremeta, defaults                      FAILED (edit.at:13)
>   32: Save/restoremeta, no compression                FAILED (edit.at:23)
>   33: Save/restoremeta, min. block size               FAILED (edit.at:33)
>   34: Save/restoremeta, 4 journals                    FAILED (edit.at:43)
>   35: Save/restoremeta, min. block size, 4 journals   FAILED (edit.at:53)
>   36: Save metadata to /dev/null                      ok
> 
> More details here:
> 
> https://buildd.debian.org/status/fetch.php?pkg=gfs2-utils&arch=armhf&ver=3.3.0-1&stamp=1599171965&file=log
> 

The "Bus error"s suggest it's failing on an unaligned access somewhere 
in restoremeta, so just armhf and sparc64 are affected. I'll look into it.

Thanks,
Andy

