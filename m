Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E90C6F833D
	for <lists+cluster-devel@lfdr.de>; Fri,  5 May 2023 14:46:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683290792;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=efb1uAsthfLnvqT0FXuhgpuGEWwMFDoJVLgx5nBBkCw=;
	b=Sj3p/gOvBr8Pv0yKw3HJCnOvRP/K64MBJdLjzgNNTGCCEszLu/XEiaVPVLC+qN9L8DjRck
	Ry0PC7GHdY8YDE3YtxgL+eWJRMrDO5zbnv+Q4kHxmB2Q5JlDntnNGIxjtHEEElgNR35o1A
	tqwrh0aWmURud21ljRX4ZFx0sxeULg8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-S4OD_S5jO_Wmf_UKZeIweA-1; Fri, 05 May 2023 08:46:28 -0400
X-MC-Unique: S4OD_S5jO_Wmf_UKZeIweA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBD3C884632;
	Fri,  5 May 2023 12:46:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E7F3492B00;
	Fri,  5 May 2023 12:46:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4F0381946A4A;
	Fri,  5 May 2023 12:46:26 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 331151946A43 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  5 May 2023 12:46:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 169551401C51; Fri,  5 May 2023 12:46:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F3611402657
 for <cluster-devel@redhat.com>; Fri,  5 May 2023 12:46:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD3A880101C
 for <cluster-devel@redhat.com>; Fri,  5 May 2023 12:46:24 +0000 (UTC)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-Nuo8kkXhOS2L7I2_vEQ3fA-1; Fri, 05 May 2023 08:46:23 -0400
X-MC-Unique: Nuo8kkXhOS2L7I2_vEQ3fA-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-61b5bcb4c09so9644016d6.2
 for <cluster-devel@redhat.com>; Fri, 05 May 2023 05:46:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683290783; x=1685882783;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=efb1uAsthfLnvqT0FXuhgpuGEWwMFDoJVLgx5nBBkCw=;
 b=Fc2NIDZYJkIVH+jL8BH5zstsYzPFTXiHUH5KymKnaFiHNMOJGcd8Kx0+kL9EShnQVq
 eaVYz/KONyjGsN10Ui4APJsRpBx88zAN9btLFzHfsIhyPJaspReED6uvJ7fOXhMNl0Y5
 bQvzAjzvRK6xDc0gY6D8YOLzJhguq5GR3GBU0QXSJb206Hw0LKzDy4RNuktbp3o7lFKp
 YQYz3CFOzZ1Ds7K2DfwP3gym31N2FXZJ3jmvV0DO9ytN6/9bicDo09QLr+9QjcmNiM/A
 zOccwfALPtlWSHghj9EIuwQBuwtTuNTgveGlJ6Tu9fHR5VLtWUeIG/C1X/WCfQTb7cnO
 2cwg==
X-Gm-Message-State: AC+VfDy5afBC+TXlpYIvTRDp/phamV9k/ozf7bsD+GFvhyeQAp3tWshf
 Qr6Dv+c4BhW+51iYPURoD+C7g7SvPrr7LwsVdTPq4V9fDugdZHE9LGpJVqjzSboiV0Rwu3l1KUT
 Rvwrzn5VXxojtDgUkkJQ7i+mKgueYrw==
X-Received: by 2002:a05:6214:124a:b0:5f1:6892:7449 with SMTP id
 r10-20020a056214124a00b005f168927449mr1697970qvv.28.1683290782925; 
 Fri, 05 May 2023 05:46:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4X86mQGeD/fSkE9jl7Mgtwufh8BKxZqHHgiNZlanzDPTFtLcAipXCDLsFeEc8MYWWD1o1xwA==
X-Received: by 2002:a05:6214:124a:b0:5f1:6892:7449 with SMTP id
 r10-20020a056214124a00b005f168927449mr1697952qvv.28.1683290782663; 
 Fri, 05 May 2023 05:46:22 -0700 (PDT)
Received: from ?IPV6:2601:883:c200:210:6ae9:ce2:24c9:b87b?
 ([2601:883:c200:210:6ae9:ce2:24c9:b87b])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a0ce103000000b00605f796d30esm556952qvk.51.2023.05.05.05.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 05:46:22 -0700 (PDT)
Message-ID: <db9eb9ea-8e29-edd5-00f7-e17a1de7c52c@redhat.com>
Date: Fri, 5 May 2023 08:46:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Steven Whitehouse <swhiteho@redhat.com>, Andrew Price <anprice@redhat.com>
References: <20230504174322.384715-1-rpeterso@redhat.com>
 <d388a721-fac9-3b3a-497b-9aee3aec7066@redhat.com>
 <d402c7018cc89db0f2c7b939c7c17552c0b8219a.camel@redhat.com>
From: Bob Peterson <rpeterso@redhat.com>
In-Reply-To: <d402c7018cc89db0f2c7b939c7c17552c0b8219a.camel@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH] gfs2: ignore rindex_update failure in
 dinode_dealloc
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/5/23 4:49 AM, Steven Whitehouse wrote:
> On Fri, 2023-05-05 at 08:44 +0100, Andrew Price wrote:
>>> This patch makes gfs2_dinode_dealloc ignore the bad return code and
>>> proceed with freeing the dinode so the QE tests will not be tripped
>>> up.
>>
>> Is it really ok to ignore all potential errors here? I wonder if it
>> should just ignore -EINTR (or whichever error the test produces) so
>> that
>> it can still fail well for errors like -EIO.
>>
>> Cheers,
>> Andy
>>
> Perhaps the more important question is why there are errors there in
> the first place?

Well, errors can be returned by gfs2_rindex_update for a number of 
reasons. The -EINTR is just one, when the test case is interrupted due 
to hitting its time limit. An -EIO may be caused by IO errors reading 
the storage media, pulled cables, failed drivers or whatever. But as I 
said in my reply to Andy's email, it's basically inconsequential to this 
code path. Errors like -EIO may prevent further reads or writes to the 
file system, its metadata, etc., in other places but that should be 
flagged up by other processes and hopefully gfs2's recovery, journal 
replays, etc., will ensure file system integrity.

Regards,

Bob Peterson

