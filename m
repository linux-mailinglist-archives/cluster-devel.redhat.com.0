Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A40447F79
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Nov 2021 13:30:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636374654;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=r2wLUO0fJc5LO3nxVf2d2+JM8fpFx4y5nS0She5/UO4=;
	b=Zv9KT8Y8JejhC/j4NduEmep3sJxL5rNW/eBqmwAdBk3vMq0uabouI6Rk4zCc8XCtiK2EyX
	Pj9Y3hqpIf7RIxwmvtJE2Qr7p9Ti4rX6kPJ+UeORMoIkTFDcYKObPLih+HTeFHI8K8rW7z
	7EGp2izYfUeJNoW2tuf9wCkXFvO91g4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-iW2L818yMUKlMF1N405skA-1; Mon, 08 Nov 2021 07:30:51 -0500
X-MC-Unique: iW2L818yMUKlMF1N405skA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0029BDF8C6;
	Mon,  8 Nov 2021 12:30:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01C6410016F2;
	Mon,  8 Nov 2021 12:30:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8197E180BAD2;
	Mon,  8 Nov 2021 12:30:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A8CUYw2013379 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Nov 2021 07:30:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9497B4047279; Mon,  8 Nov 2021 12:30:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90E6D4047272
	for <cluster-devel@redhat.com>; Mon,  8 Nov 2021 12:30:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78C7085A5BD
	for <cluster-devel@redhat.com>; Mon,  8 Nov 2021 12:30:34 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-280-M7MQT7YCPoaOWMa68NkQ0Q-1; Mon, 08 Nov 2021 07:30:33 -0500
X-MC-Unique: M7MQT7YCPoaOWMa68NkQ0Q-1
Received: by mail-wm1-f72.google.com with SMTP id
	y9-20020a1c7d09000000b003316e18949bso6144266wmc.5
	for <cluster-devel@redhat.com>; Mon, 08 Nov 2021 04:30:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:to
	:content-language:from:subject:content-transfer-encoding;
	bh=r2wLUO0fJc5LO3nxVf2d2+JM8fpFx4y5nS0She5/UO4=;
	b=iNDnFSwLAnO7DQqvBvHKJB02jUpPdgEq455bgc7Dsc6xLGUjt5gTTnLRVryk9EjRF9
	gO2E7T417Wofs5c5oVc0byPM6RwV/0aJM/fBxIZG1QOFggLX9MeCfb7rK5lyaKJxVJs3
	JfCpbIc5VeSQQ7VKjs6wrBeer2S7voNJogmAB4RQ2KMUKZShQYpRcoRf3VrHtRalTIcL
	efUwP/Ju32hByV7TwZRY3VW9Qkr1PEdTkCn69RACwQUYbADZwAP69sh5v9diC78NnCeh
	0jxWpBxDlISKfjLtW9xDO0Tpb2f/X4G76Gs9A2JjvR05oDzjMhYRSFozUOP/YcNcxk3B
	QYvA==
X-Gm-Message-State: AOAM533nTrxkLkDRttk6e/iAypMo5a4GP3Fhn7ptVGxlFHjfTaOlqj8n
	4QS/Ig6J9fvoHbQDKXhVzmTzHxvZZiVJXOuAmDZMxyo+C1Zzfh7U0vMU0/LgnONvANT/xlqi6Si
	+b4bmU26l54vl5Ww4WAdNDyJf6ueDh54NBtTin8Z5cnvsoEGmrK8PLWAm/26UX8samAjYwrhJ
X-Received: by 2002:adf:f551:: with SMTP id j17mr97865771wrp.392.1636374632192;
	Mon, 08 Nov 2021 04:30:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7aTNxxSV2JR+2WsY7kSmBl/owhTgqAWrWaYjSNzgwiGOAMNuMlGPUQvvPg+lqWfmwvJI6sQ==
X-Received: by 2002:adf:f551:: with SMTP id j17mr97865753wrp.392.1636374632044;
	Mon, 08 Nov 2021 04:30:32 -0800 (PST)
Received: from [192.168.1.146]
	(cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
	by smtp.gmail.com with ESMTPSA id e3sm16400377wrp.8.2021.11.08.04.30.31
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 08 Nov 2021 04:30:31 -0800 (PST)
Message-ID: <9f72046b-b162-c5dc-4765-06851dedfcfe@redhat.com>
Date: Mon, 8 Nov 2021 12:30:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.1.0
To: cluster-devel@redhat.com
From: Andrew Price <anprice@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] gfs2-utils pull requests enabled
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I've enabled the pull requests feature for gfs2-utils.git on 
https://pagure.io/gfs2-utils after a contributor enquired about it. I 
don't expect to receive many of them but the option is now there for 
those who prefer it to emailing patches.

Cheers,
Andy

