Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A907A65A5
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Sep 2023 15:47:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695131251;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/cnQQ+1FpuAyRo1tcmR0zdORz8ekModLomlbAQnH4nY=;
	b=cb+MezX97Bv/7+1qYg8+9rlnzNcgprccb9YXFeYm+tcNYUrfdgvvI63uagvqg84g5RcD7X
	gPXP/8RbcO/Eg5vSdwEOihSBPkEMfh9tArtnlVntqHQbCLBrP6zocb+EKzzQeacJ1RAbIE
	TlQWfEQI6ypPssJ8p0hUwiKwYcT1kKk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-PQypDbeXOUi_6GaHpVZI4w-1; Tue, 19 Sep 2023 09:47:24 -0400
X-MC-Unique: PQypDbeXOUi_6GaHpVZI4w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 470EE29ABA06;
	Tue, 19 Sep 2023 13:47:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DEF2C4026F8;
	Tue, 19 Sep 2023 13:47:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7104C1946595;
	Tue, 19 Sep 2023 13:47:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B00A6194658C for <cluster-devel@listman.corp.redhat.com>;
 Tue, 19 Sep 2023 13:47:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 87C4E20268CC; Tue, 19 Sep 2023 13:47:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8054F20268CB
 for <cluster-devel@redhat.com>; Tue, 19 Sep 2023 13:47:07 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-inbound-delivery-1.mimecast.com [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61D58811E88
 for <cluster-devel@redhat.com>; Tue, 19 Sep 2023 13:47:07 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-vtXqMF-CNYutKBAwnXMQdw-1; Tue, 19 Sep 2023 09:47:05 -0400
X-MC-Unique: vtXqMF-CNYutKBAwnXMQdw-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-76f2d10edcbso701580285a.1
 for <cluster-devel@redhat.com>; Tue, 19 Sep 2023 06:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695131225; x=1695736025;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/cnQQ+1FpuAyRo1tcmR0zdORz8ekModLomlbAQnH4nY=;
 b=qU7ENmUxFvEan75LfZjAItvqXeSwMOz1y5cECGrOdS3EHzTM42ntWOLkbdolSMWWFT
 rLC+cvl5xXhvdsvqNjRVnsMALsczZ+D9GgSzUJANNQlSnceSq532ql7exYuZPXfsfoJ8
 yoUMxj8c5Xvc7uL5imJdZmxBtfPQieLhQTZM0R/XjbwY+WD7nFp1czSTAJ4nXwDcoRv4
 g5ZvD5rsGB5Z1fgavyL5pOHL/wG6d+gFNwrDQTjHRsDhTBIYjz11HR/K21Jn/rtU3DUx
 eBLRtNE41lj6EXOV3+VHFTSt17lJzwengqpGXPCfh3cRGDFN1AibjYsfLjGNgZ7kKf1m
 fN2A==
X-Gm-Message-State: AOJu0YxIwoI8/G73ULcF8ss/P3hruwZmGnuljqtkckePgQTzY85B8lUs
 tgqthK3uhV4CmILKV+g6SmoImWQ+93AzzGMDUv6MEmcrPYYuC6coS3iLIXTQxwCRJjvGd0ltNi5
 w2AHGmj30Lu9ibo9RegAgCuufT1o3X1zuGBysZGilktjUkp5f7LHiW5OIBfOrhA10Rh1XunJDYo
 L7E29Q
X-Received: by 2002:ad4:4c48:0:b0:651:9fa8:9f62 with SMTP id
 cs8-20020ad44c48000000b006519fa89f62mr12788830qvb.48.1695131225000; 
 Tue, 19 Sep 2023 06:47:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNF3p3rJ7SWxPtyrIB4ZppFNr0DJAuQ/oP0I8jZ8YTPit6Cm3uwk5EyNFIGHlU6BoMSoGFGg==
X-Received: by 2002:ad4:4c48:0:b0:651:9fa8:9f62 with SMTP id
 cs8-20020ad44c48000000b006519fa89f62mr12788800qvb.48.1695131224563; 
 Tue, 19 Sep 2023 06:47:04 -0700 (PDT)
Received: from [192.168.1.165]
 (cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a0ce414000000b0064f713574dcsm2961651qvl.67.2023.09.19.06.47.03
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Sep 2023 06:47:03 -0700 (PDT)
Message-ID: <f3cd93f8-f688-c218-c426-0b3b4ff6743b@redhat.com>
Date: Tue, 19 Sep 2023 14:47:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: cluster-devel <cluster-devel@redhat.com>
From: Andrew Price <anprice@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] Reminder: New mailing list for gfs2 and dlm
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

For those of you still reading cluster-devel, please be aware that gfs2 
and dlm development have now moved to gfs2@lists.linux.dev

Please subscribe to the new list to avoid missing new developments, by 
sending a message to:

   gfs2+subscribe@lists.linux.dev

The new list is hosted at kernel.org. There is more information about it 
here:

    https://subspace.kernel.org/lists.linux.dev.html

Thanks,
Andy

