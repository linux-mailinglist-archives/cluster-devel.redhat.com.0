Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1940F46D9C2
	for <lists+cluster-devel@lfdr.de>; Wed,  8 Dec 2021 18:32:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638984739;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EJXuSew8F+e4rxSpIqCj10ZR599cmyrrpGq9jwrjVIA=;
	b=Y7VFDEUbkCdYdQ5yR4r7O8W10FldplXlNzrlAiWaMINP/MACWypoAGX/itaE3yuzEVEPKF
	ANDJZSExIzT7ZAXlaoLNFxz/QFB7nGnmY3zJtoQjdX+w5c7BM2exnJKhm4/3VV4vLhSbF4
	eDJ/aD9Q8Uc8s4gQCqFmlp6ox5SPJQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63--e0gJ0kMPzekiOwkSsL5NA-1; Wed, 08 Dec 2021 12:32:15 -0500
X-MC-Unique: -e0gJ0kMPzekiOwkSsL5NA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 463635F9CA;
	Wed,  8 Dec 2021 17:32:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C02045D7C;
	Wed,  8 Dec 2021 17:32:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 861A34BB7C;
	Wed,  8 Dec 2021 17:32:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B8HW8OT011938 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 8 Dec 2021 12:32:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 47E911121315; Wed,  8 Dec 2021 17:32:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 438BB1121314
	for <cluster-devel@redhat.com>; Wed,  8 Dec 2021 17:32:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AFD7801212
	for <cluster-devel@redhat.com>; Wed,  8 Dec 2021 17:32:05 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-13-AXYTT-AgPqW8hhsLjRCwJw-1; Wed, 08 Dec 2021 12:32:03 -0500
X-MC-Unique: AXYTT-AgPqW8hhsLjRCwJw-1
Received: by mail-wm1-f71.google.com with SMTP id
	l4-20020a05600c1d0400b00332f47a0fa3so1584865wms.8
	for <cluster-devel@redhat.com>; Wed, 08 Dec 2021 09:32:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:references:cc:from:in-reply-to
	:content-transfer-encoding;
	bh=EJXuSew8F+e4rxSpIqCj10ZR599cmyrrpGq9jwrjVIA=;
	b=tp5eqT+CRgG7MfFp41PBIyCgxJtJLq8louj7Sqsm7dsmnkJQOV+LcEd7NQRP9EwbMI
	qxJsc0fV1Z1ludh/MvEFIC1qc+bPZEDtnwlc2jv+a87yNw2nKusN79ZjTMTm9zsFVusH
	/jul+ILXJrtoLEog1H+T0Qb1fKRK14h/UWBtrerq5KI4Va/TX922W7j43+qdRfJ5Fp+e
	otEry2amLQnEuKXjQG9Ksxqyb+FH2JuikctZWGzXbH4STGcMd/HkzdepRmbpikc/Oi6q
	1fsk1J76epM08JeLDmxzz28XGOTwAHiU9LiFmHyeXRPl0dqXHaHVGKeC1KoLVLYo7/Yj
	goIw==
X-Gm-Message-State: AOAM532qmXVv9DDn7uNIcuK1wQyBZ+XVzNMAh9RoR3QzKrgiekRaLDAO
	/7FQmgSPriQGfMWlsEuzwxropJp8o+ZmvJG4BtSnR3U77kGv4I9UXnWKAhAovGK7fKn7kv9XVkP
	tclYon8JWYHGsWtQTOaQoHg==
X-Received: by 2002:a1c:a58d:: with SMTP id o135mr57492wme.93.1638984722847;
	Wed, 08 Dec 2021 09:32:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJXZsj9TBXQZqivCYt1xfsT6M9mvFITCgLP1R9B9tgFhOwYMWJrKSuqbJUZhqgFQ6H3tdK7Q==
X-Received: by 2002:a1c:a58d:: with SMTP id o135mr57463wme.93.1638984722695;
	Wed, 08 Dec 2021 09:32:02 -0800 (PST)
Received: from [192.168.1.145]
	(cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
	by smtp.gmail.com with ESMTPSA id
	x13sm3468783wrr.47.2021.12.08.09.32.02
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 08 Dec 2021 09:32:02 -0800 (PST)
Message-ID: <a77febc1-4995-6774-4dd6-8e9e915e437d@redhat.com>
Date: Wed, 8 Dec 2021 17:32:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.3.0
To: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
References: <398059639.62550733.1638982241202.JavaMail.zimbra@helmholtz-muenchen.de>
From: Andrew Price <anprice@redhat.com>
In-Reply-To: <398059639.62550733.1638982241202.JavaMail.zimbra@helmholtz-muenchen.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] message in syslog: shrink_slab:
 gfs2_glock_shrink_scan+0x0/0x240 [gfs2] negative objects to delete
 nr=xxxxxxxxxxxx
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
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bernd,

On 08/12/2021 16:50, Lentes, Bernd wrote:
> Hi,
> 
> i hope this is the right place for asking about GFS2.
> Yesterday one of my two nodes HA-cluster got slower and slower, until it was fenced.
> In /var/log/messages i found this message repeated often before the system got slower:
> shrink_slab: gfs2_glock_shrink_scan+0x0/0x240 [gfs2] negative objects to delete nr=xxxxxxxxxxxx
> What does it mean ? Is it a problem ?

This could be the same issue as 
https://bugzilla.redhat.com/show_bug.cgi?id=1599324

The last comment in that bug mentions a kernel patch that is probably 
missing from your distro kernel version.

Cheers,
Andy

> 
> My Setup:
> SuSE SLES 12 SP5
> Kernel 4.12.14-122.46-default
> Pacemaker 1.1.23
> corosync 2.3.6-9.13.1
> gfs2-utils-3.1.6-1.101.x86_64
> 
> Thanks.
> 
> Bernd
> 

