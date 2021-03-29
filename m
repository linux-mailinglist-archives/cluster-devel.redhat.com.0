Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 78E6134C6A3
	for <lists+cluster-devel@lfdr.de>; Mon, 29 Mar 2021 10:09:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617005390;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eYmW+CS3toei04Vmp3KpLa6ig+LtfK1AAXxcITfhKF0=;
	b=YYTkM/WKKDYZVHwG03IhBOfeiMEWaakNC3M/5QjyckD3CmPcRs22USqzzgZ3ZBRSHFiVan
	8XgZyesu0BB+oMvB5s8JEc1Y8rwqBIFDiHphMmyjjcIFkNjlICukUozTdbUiWdPZHXFhwx
	nVaFzlLMhsgrrfyBJypdog+iIRX3y8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-Szk4bl4yMVWxYzRfRHoPAw-1; Mon, 29 Mar 2021 04:09:48 -0400
X-MC-Unique: Szk4bl4yMVWxYzRfRHoPAw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9A4D107ACCD;
	Mon, 29 Mar 2021 08:09:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14CDD629BF;
	Mon, 29 Mar 2021 08:09:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B95B1809C82;
	Mon, 29 Mar 2021 08:09:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12T88Mev004626 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 29 Mar 2021 04:08:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B800110023AC; Mon, 29 Mar 2021 08:08:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 005601001B2C;
	Mon, 29 Mar 2021 08:08:19 +0000 (UTC)
To: Alexander Ahring Oder Aring <aahringo@redhat.com>,
	Andrew Price <anprice@redhat.com>
References: <20210325175828.12708-1-aahringo@redhat.com>
	<5cc2e70b-6166-14fd-b46e-0ba1bb5dd4b4@redhat.com>
	<CAK-6q+jstsOToQGJD1xrqCNFvzibzeZY74x59_RF86_xC=41cw@mail.gmail.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <321e1cb6-991c-f98a-dd6c-b86f312eca10@redhat.com>
Date: Mon, 29 Mar 2021 09:08:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAK-6q+jstsOToQGJD1xrqCNFvzibzeZY74x59_RF86_xC=41cw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH gfs2-utils] man: gfs2.5: remove barrier
 automatically turned off note
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

On 26/03/2021 13:46, Alexander Ahring Oder Aring wrote:
> Hi,
>
> On Fri, Mar 26, 2021 at 6:41 AM Andrew Price <anprice@redhat.com> wrote:
>> On 25/03/2021 17:58, Alexander Aring wrote:
>>> This patch removes a note that the barrier option is automatically turned
>>> off if the underlaying device doesn't support I/O barriers. So far I
>>> understand it's default on, means "barriers" option is applied which
>>> should not make any problems if the underlaying device supports something
>>> or not. There is by the kernel or gfs2-utils no automatically detection
>>> going on which changes this mount option.
>> Hm, should there be automatic detection? Has there ever been? I'd like
>> to get to the bottom of why this language is here before removing it.
>>
> no idea if there was ever an auto detection or there exists currently
> one. I didn't find any auto detection during my research. The related
> part came in by: 06b5fb87 ("gfs2: man page updates"). My understanding
> is that this option is default "barrier" and you should do "nobarrier"
> in cases when you know what you are doing. I even don't know if such
> automatic detection is possible, the man-page says "(e.g. its on a
> UPS, or it doesn't have a write cache)" in regards to block devices. I
> think there is no way in the kernel/user space to check if the block
> device is behind a UPS. Maybe there exists some in user space over
> hdparm but then things need to be right connected? Regarding cache
> handling, you need to know a lot about the used architecture.
>
> I am not sure here as well. I was reading about such automatic
> detection and wanted to see how it's done with the result: there is no
> auto detection (in gfs2(kernel)/gfs2-utils software)?
>
> - Alex
>

Bare in mind that the naming of the barrier mount option is historic and 
that it is now implemented using flush commands rather than barriers. I 
don't think there is any automated way to discover if it is safe to run 
without flushes,

Steve.


