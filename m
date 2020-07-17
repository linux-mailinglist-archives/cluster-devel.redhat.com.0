Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B70EF2236C6
	for <lists+cluster-devel@lfdr.de>; Fri, 17 Jul 2020 10:16:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-KAumTAumM1Cnsh95iRZmcQ-1; Fri, 17 Jul 2020 04:16:54 -0400
X-MC-Unique: KAumTAumM1Cnsh95iRZmcQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAA06800597;
	Fri, 17 Jul 2020 08:16:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 883A772E4A;
	Fri, 17 Jul 2020 08:16:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E5AA118095FF;
	Fri, 17 Jul 2020 08:16:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06H8Egbc025570 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jul 2020 04:14:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BD8712157F23; Fri, 17 Jul 2020 08:14:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B793D2166BA3
	for <cluster-devel@redhat.com>; Fri, 17 Jul 2020 08:14:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBDB41832D23
	for <cluster-devel@redhat.com>; Fri, 17 Jul 2020 08:14:39 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-232-g11QSbbhOU-ozlnn6vv18A-1; Fri, 17 Jul 2020 04:14:37 -0400
X-MC-Unique: g11QSbbhOU-ozlnn6vv18A-1
Received: by mail-wm1-f67.google.com with SMTP id f18so15900448wml.3;
	Fri, 17 Jul 2020 01:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:cc:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Rmc0G3O2DspQbd7hyYWFkbqoyG9H9j3obLtHIngva+Q=;
	b=MzUhoqo4RoCRzK3n7lZU/TZ172NW1VNU0ULtV94f/xfvh1h2jIlDaFLbjc7kUqJg2T
	b0b32V7Yps0xfrcluOzP+PcbebHaCxXXyPT8SGnAm6Koreo3/3Oc7D0+n1WFVqkcwEVp
	TXZOlGSrcSR8IzNnPFE7LRnTed1eg+tRtO8SBxDIVIr+RFd24mK3dyCoNfq9EHzsRRBS
	xxtVSmwVDmULeQn37azOgjkrfmI9BC/wjIqowodEWIGDun9QbCa8dMK9wFedN1l8p0B+
	RLGOZmm7euuuCB9QsnTM85ZpRNLBOekuqm02HNwgiJ0WycpBuXLqz4jMkXeX5UHFf4Fi
	xPSA==
X-Gm-Message-State: AOAM533V9eS3q1vCnUviFt7jSoGD2VmFTuFpPJqZRUfJOIoDXGUtj3LM
	fXXPiesUIJJC2bmVGaKdwz4MP+Jw
X-Google-Smtp-Source: ABdhPJz5Xx9ApbEgbRkvtvugM+qJEJ2sDsAFGZofvz6lPh4CnNgJV0K23i+OlXMfogd8ziBciXlsfA==
X-Received: by 2002:a1c:bc8a:: with SMTP id m132mr7769292wmf.1.1594973674749; 
	Fri, 17 Jul 2020 01:14:34 -0700 (PDT)
Received: from ?IPv6:2001:a61:3adb:8201:9649:88f:51f8:6a21?
	([2001:a61:3adb:8201:9649:88f:51f8:6a21])
	by smtp.gmail.com with ESMTPSA id
	y16sm13255655wro.71.2020.07.17.01.14.33
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 17 Jul 2020 01:14:34 -0700 (PDT)
To: Andrew Price <anprice@redhat.com>
References: <20200709130317.582038-1-anprice@redhat.com>
From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <d57b1028-21e5-f573-6f66-0a53748d1be0@gmail.com>
Date: Fri, 17 Jul 2020 10:14:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200709130317.582038-1-anprice@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-man@vger.kernel.org, mtk.manpages@gmail.com
Subject: Re: [Cluster-devel] [PATCH] lseek.2: List gfs2 support for
	SEEK_HOLE/SEEK_DATA
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 7/9/20 3:03 PM, Andrew Price wrote:
> Signed-off-by: Andrew Price <anprice@redhat.com>

Thanks, Andrew. Patch applied.

Cheers,

Michael

> ---
>  man2/lseek.2 | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/man2/lseek.2 b/man2/lseek.2
> index a20b10431..22de446fc 100644
> --- a/man2/lseek.2
> +++ b/man2/lseek.2
> @@ -182,6 +182,9 @@ NFS (since Linux 3.18)
>  .IP *
>  FUSE (since Linux 4.5)
>  .\" commit 0b5da8db145bfd44266ac964a2636a0cf8d7c286
> +.IP *
> +GFS2 (since Linux 4.15)
> +.\" commit 3a27411cb4bc3ce31db228e3569ad01b462a4310
>  .SH RETURN VALUE
>  Upon successful completion,
>  .BR lseek ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/

