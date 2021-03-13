Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCA4339ECE
	for <lists+cluster-devel@lfdr.de>; Sat, 13 Mar 2021 16:10:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615648224;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nC2YinBLbF5x8z64ESqGYHhmjrmstsuxLWPfYWpEmOI=;
	b=L41+gw42rYT/XjcRjDwrJvDz5utByfw3ewoUmXy+QB60d4czT1V2ua6JTn/OhEcJ9+5rsL
	XlgWj0dbC0FT0dEGN5fzDjmfA3fMZGhIuSWSfYQ4ebomIIIQA7a+S3GvJNYLNoV685ptE6
	c9l3ReBLBicljBCTlNEInc8OeeVhY58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-yF8f5wgwPOec0qftAdRzhA-1; Sat, 13 Mar 2021 10:10:22 -0500
X-MC-Unique: yF8f5wgwPOec0qftAdRzhA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0791118460E0;
	Sat, 13 Mar 2021 15:10:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CA5218A9E;
	Sat, 13 Mar 2021 15:10:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5504BCF5D;
	Sat, 13 Mar 2021 15:10:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12DFA7pl024723 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 13 Mar 2021 10:10:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8427119716; Sat, 13 Mar 2021 15:10:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.36.115.218] (ovpn-115-218.ams2.redhat.com [10.36.115.218])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A950B19D80;
	Sat, 13 Mar 2021 15:10:00 +0000 (UTC)
To: Alexander Aring <aahringo@redhat.com>
References: <20210311192036.17218-1-aahringo@redhat.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <828418cd-568e-8916-2022-1f1c8fb21a07@redhat.com>
Date: Sat, 13 Mar 2021 15:09:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210311192036.17218-1-aahringo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH gfs2-utils 0/2] glocktop: dlmwaiters
	above 100 fixes
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
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/03/2021 19:20, Alexander Aring wrote:
> Hi,
> 
> these patches fixes issues for me with glocktop. I got a:
> 
> 
> *** buffer overflow detected ***: terminated
> Aborted (core dumped)
> 
> debugging with gdb figured out that there are some maximum limitation to
> handle dlm waiters which was in my case 117. This patches increased the
> maximum allowed dlm waiters. These limitations are still static and
> should be changed to dynamic allocation in due courses otherwise buffer
> overflow happens again.
> 
> - Alex
> 
> Alexander Aring (2):
>    glocktop: use MAX_LINES for dlmwlines
>    glocktop: allocate fsdlm dynamically
> 
>   gfs2/glocktop/glocktop.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 

Applied. Thanks Alex.

Andy

