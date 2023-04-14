Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7243E6E266D
	for <lists+cluster-devel@lfdr.de>; Fri, 14 Apr 2023 17:07:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681484846;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8YNqoRsuHgUJoHmB5+HjqdN8eYxEchAFI//QQsvuhw4=;
	b=Bt5gXh5xVs8zf9PrzomrCt4ZJ2C70xhwFgf8y5N3QtiZBScGG6K5c8m0Z+x7/tt9QQuCwQ
	MrRsCJcNnWGhsU1YF0wPloi37+A1Kty7p8xYYg7wpxTkub/yhIJgeWYIoJuctS49aPuFlW
	lu9HfSk5tFeURpvRuk7e844pctvvfq0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-vJ72Gsp6OBCZS36Dvzx8Uw-1; Fri, 14 Apr 2023 11:07:24 -0400
X-MC-Unique: vJ72Gsp6OBCZS36Dvzx8Uw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64C9B85530C;
	Fri, 14 Apr 2023 15:07:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E4553C16028;
	Fri, 14 Apr 2023 15:07:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8EE1619472CE;
	Fri, 14 Apr 2023 15:07:20 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F36C419472CC for <cluster-devel@listman.corp.redhat.com>;
 Fri, 14 Apr 2023 15:07:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C0DA9C1602A; Fri, 14 Apr 2023 15:07:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA201C16028
 for <cluster-devel@redhat.com>; Fri, 14 Apr 2023 15:07:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E60A886065
 for <cluster-devel@redhat.com>; Fri, 14 Apr 2023 15:07:07 +0000 (UTC)
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-Ygzi8ka4PJSsQBAACgK_Hw-1; Fri, 14 Apr 2023 11:06:58 -0400
X-MC-Unique: Ygzi8ka4PJSsQBAACgK_Hw-1
Received: by mail-lf1-f72.google.com with SMTP id
 q11-20020a19f20b000000b004ec86f8b0b0so6690455lfh.23
 for <cluster-devel@redhat.com>; Fri, 14 Apr 2023 08:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681484817; x=1684076817;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8YNqoRsuHgUJoHmB5+HjqdN8eYxEchAFI//QQsvuhw4=;
 b=CzlpXkNTu1VHGCCWoF2BO7feLCksLFUoalHdW8ggysFX3ec0Og2v2bhlpKxmK5r+1W
 xZSyFjin0iyYGCtiljRpIPALcHuZDsKNFwPyADJXTdqcXPl5tMTNmJgMpSAEPw+5f9tU
 sF9HOxtFtwuE8E7Htkt9ew2rcGj8OIOcWP3ygm+jR0G5EgJmgYcXxDCzJTpfnzZP1Gkh
 unBIipo26WyrYvw5zyezW71qxsT4g3DgAhnyYd9QYYaoSSc7yYrAXVpwSVuq1/MDYCmo
 8tS0bSR4IMhXHjorIJXw2hKwsfQEJa/jnAcT0eUrjPWrnMFxD6HrXJCO4H35CEaOzhN6
 Bv/A==
X-Gm-Message-State: AAQBX9c9h93JBszq4V1/wB7rjNtHa7BXo0xnFUVBwjHPO1YAFEirF2p2
 sdOaKDMKRJaUYyQwaHBiJ4t6flTFZCkkAx3mWcTFCD0uNwsyE0oaaXcTrb64VsXBOVsVvXzF2cq
 lTL/gJ2QG3P9IAGN7ssRyqQ==
X-Received: by 2002:a2e:9605:0:b0:2a6:3b0b:3d3a with SMTP id
 v5-20020a2e9605000000b002a63b0b3d3amr2257275ljh.40.1681484817334; 
 Fri, 14 Apr 2023 08:06:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350aiBEcv2B8zLHdRcWr0RkkBL6COuiGuhc13GyXLaxVZtXM/hwgK3zi+abl/GWjLXwzgBH0Jjw==
X-Received: by 2002:a2e:9605:0:b0:2a6:3b0b:3d3a with SMTP id
 v5-20020a2e9605000000b002a63b0b3d3amr2257264ljh.40.1681484816992; 
 Fri, 14 Apr 2023 08:06:56 -0700 (PDT)
Received: from [192.168.0.200] (87-59-200-15-cable.dk.customer.tdc.net.
 [87.59.200.15]) by smtp.gmail.com with ESMTPSA id
 f14-20020a2ea0ce000000b002a777ce224dsm848094ljm.138.2023.04.14.08.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 08:06:56 -0700 (PDT)
Message-ID: <7f03a5d1-be7c-7ed4-6fb4-f377a1282efb@redhat.com>
Date: Fri, 14 Apr 2023 17:06:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Alexander Aring <aahringo@redhat.com>, teigland@redhat.com
References: <20230411144916.1231886-1-aahringo@redhat.com>
From: "Fabio M. Di Nitto" <fdinitto@redhat.com>
In-Reply-To: <20230411144916.1231886-1-aahringo@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH dlm-tool 1/4] fence: make pkg-config
 binary as passable make var
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alex,

all 4 patches look good to me.

Cheers
Fabio

On 11/04/2023 16.49, Alexander Aring wrote:
> This patch defines PKG_CONFIG make var which could be overwrite by the
> user like it's the case for dlm_controld Makefile.
> ---
>   fence/Makefile | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/fence/Makefile b/fence/Makefile
> index ee4dfb88..894f6396 100644
> --- a/fence/Makefile
> +++ b/fence/Makefile
> @@ -19,7 +19,10 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
>   
>   CFLAGS += -fPIE -DPIE
>   CFLAGS += -I../include
> -CFLAGS += $(shell pkg-config --cflags pacemaker-fencing)
> +
> +PKG_CONFIG ?= pkg-config
> +
> +CFLAGS += $(shell $(PKG_CONFIG) --cflags pacemaker-fencing)
>   
>   LDFLAGS += -Wl,-z,relro -Wl,-z,now -pie
>   LDFLAGS += -ldl

