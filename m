Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 983D03F6313
	for <lists+cluster-devel@lfdr.de>; Tue, 24 Aug 2021 18:48:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629823695;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wGtHE10PrzOPHjxoYspJqidH3av4b0QssG3l/yevHx8=;
	b=e+dk7CpAXCcELIcjyjiCE6x1tRlZjDD8xY3dyDpDh9fZAYglcRE/eBn0zn1u/gyr+VmUPp
	cHm/w2LKG03pZzQV3NYi2Xsl0VeBFX9bq9HU1045WW85teDYPx0BFFrx/DL3nSpzjfuLEF
	VeJtgFco6LYbM4hymK4kuBf/o7pmaAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-y9k-_BnTOSCfclR6C7OJww-1; Tue, 24 Aug 2021 12:48:14 -0400
X-MC-Unique: y9k-_BnTOSCfclR6C7OJww-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 218FD34906;
	Tue, 24 Aug 2021 16:48:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A67D5D6CF;
	Tue, 24 Aug 2021 16:48:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD0084BB7B;
	Tue, 24 Aug 2021 16:48:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17OGm8Ci017519 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 24 Aug 2021 12:48:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C870E741F; Tue, 24 Aug 2021 16:48:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C35EE9E6A
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 16:48:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F16F41066693
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 16:48:03 +0000 (UTC)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
	[209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-45-tIbAPdtYMgunf_3W2ZimLg-1; Tue, 24 Aug 2021 12:48:02 -0400
X-MC-Unique: tIbAPdtYMgunf_3W2ZimLg-1
Received: by mail-io1-f70.google.com with SMTP id
	l4-20020a6bd104000000b005bb1bd35b3eso8351328iob.18
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 09:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wGtHE10PrzOPHjxoYspJqidH3av4b0QssG3l/yevHx8=;
	b=Q5VFikT2YR1Jwsb/1IJobFkhcgchEl/yFx3dvNyO8lJZm/lzwX/JhJX/ZyaJtbG0xu
	IUXdMjabiTpP8YYSBZu1cGToyFEc0NqlBaC1sgxJ/QRJ90dds78V2xvTLrv9jGJgKtPH
	puerThbA271bW9Yg5X40uLB2747OCBbTmUP6NuVcyK78ScVL2bnN7hh0tU6QNwpYUilp
	h4RjOSzCiusv3gOJw38KdcDFBccha0djEhUKopwhQGxEYHdpJ7PQhCjaGC3EihDvD/RB
	dC0aBQcdDVKziLHMq/ZSsXja541yGHo7cdtBP47OEpJmDZ9DzyfgQfXuYUhKYNlH9l9o
	Du6g==
X-Gm-Message-State: AOAM531EMMiIbixZzB8dFYyH7p1PFaj6vWmoRoIqB5L482wdNgKZwj03
	GsUHW7WSHVYzdU5q94wdcLrBe3vhCOoB8dl/OPWece9tR5N/dnQLAnmjUr9/EBEg8C5449ZG7Ps
	T3uu+9atKPYRxDhLB1DTV8J3998fw50dl5o0fFIIXm2M+jFpjOtDHE85yWCxlljxe5DI3NclIhw
	==
X-Received: by 2002:a05:6638:10c7:: with SMTP id
	q7mr34806603jad.97.1629823681536; 
	Tue, 24 Aug 2021 09:48:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyB8vd2Xpp+AMKlipLpyZVfJf+Dcp6Nq8cFeyENmMYO9RAaiFzGu212a2oRHoXNBAd+o4aTSQ==
X-Received: by 2002:a05:6638:10c7:: with SMTP id
	q7mr34806585jad.97.1629823681359; 
	Tue, 24 Aug 2021 09:48:01 -0700 (PDT)
Received: from [172.16.0.19] (209-212-39-192.brainerd.net. [209.212.39.192])
	by smtp.gmail.com with ESMTPSA id
	o11sm10133036ilf.86.2021.08.24.09.48.00
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 24 Aug 2021 09:48:00 -0700 (PDT)
To: Andreas Gruenbacher <agruenba@redhat.com>
References: <20210824140241.149386-1-rpeterso@redhat.com>
	<20210824140241.149386-2-rpeterso@redhat.com>
	<CAHc6FU7SLAyoMc828JPAjb_z9YBM=dESDA3Lir5HWRt0e6ri3Q@mail.gmail.com>
From: Bob Peterson <rpeterso@redhat.com>
Message-ID: <26cea225-e7c4-bf96-57a2-5416ffb7d8c2@redhat.com>
Date: Tue, 24 Aug 2021 11:48:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHc6FU7SLAyoMc828JPAjb_z9YBM=dESDA3Lir5HWRt0e6ri3Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 1/3] gfs2: switch go_xmote_bh glop
 to pass gh not gl
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
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 8/24/21 11:12 AM, Andreas Gruenbacher wrote:
> On Tue, Aug 24, 2021 at 4:02 PM Bob Peterson <rpeterso@redhat.com> wrote:
>> Before this patch, the go_xmote_bh function was passed gl, the glock
>> pointer. This patch switches it to gh, the holder, which points to the gl.
>> This facilitates improvements for the next patch.
>>
>> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
>> ---
>>   fs/gfs2/glock.c  | 4 ++--
>>   fs/gfs2/glops.c  | 5 +++--
>>   fs/gfs2/incore.h | 2 +-
>>   3 files changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
>> index e0eaa9cf9fb6..d43eed1696ab 100644
>> --- a/fs/gfs2/glock.c
>> +++ b/fs/gfs2/glock.c
>> @@ -562,9 +562,9 @@ static void finish_xmote(struct gfs2_glock *gl, unsigned int ret)
>>          if (test_and_clear_bit(GLF_DEMOTE_IN_PROGRESS, &gl->gl_flags))
>>                  gfs2_demote_wake(gl);
>>          if (state != LM_ST_UNLOCKED) {
>> -               if (glops->go_xmote_bh) {
>> +               if (gh && glops->go_xmote_bh) {
> 
> This changes when the callback is called. Please explain why that's okay.

This is okay because patch 3 eliminates go_xmote_bh() completely anyway.
I just threw the "gh &&" as an abundance of precaution.

Regards,

Bob

