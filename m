Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B2D6FF3DF
	for <lists+cluster-devel@lfdr.de>; Thu, 11 May 2023 16:19:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683814758;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TiVITEKWavoHQgypF8pQku8juEEqjvvowDHxJw6B5t0=;
	b=hqXjmvot38E64bGphJB4yNYsP5gygN2CisaYBPf4OcsnAfScxsWAbdfzphj05dm5N5pdI6
	8fPlLEXC2cCGQlwfK8j3A/JuWuHPjbF43fjOKcKZ/YhnPrOohqeOrVKJVZpDy4nYQiDhsD
	MK10iSnKTIcubtvSQRnfedbR2n4/15U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-bPKNxMV7M-6Apir17uu_BA-1; Thu, 11 May 2023 10:19:15 -0400
X-MC-Unique: bPKNxMV7M-6Apir17uu_BA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CA1F857DE7;
	Thu, 11 May 2023 14:19:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C3F02026D25;
	Thu, 11 May 2023 14:19:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3C3A719451D3;
	Thu, 11 May 2023 14:18:51 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2445219451C7 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 11 May 2023 14:18:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E98512166B29; Thu, 11 May 2023 14:18:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E01A12166B26
 for <cluster-devel@redhat.com>; Thu, 11 May 2023 14:18:49 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9E793C10244
 for <cluster-devel@redhat.com>; Thu, 11 May 2023 14:18:49 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-R-zjyi-FOt-oZtLGPzMmmQ-1; Thu, 11 May 2023 10:18:48 -0400
X-MC-Unique: R-zjyi-FOt-oZtLGPzMmmQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-61a6bb9f808so44627076d6.3
 for <cluster-devel@redhat.com>; Thu, 11 May 2023 07:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683814727; x=1686406727;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TiVITEKWavoHQgypF8pQku8juEEqjvvowDHxJw6B5t0=;
 b=Y5e/Zd0A2To0sxEEcb+gSENJhjKIG4l6qTyQzGYZn1kHNHxq73yGiBAgkAgjsph5zZ
 3RZbOSMOPo/3EHJQZq691vfuKBUYiPB5sHwHvmHN/LUbkzo4WWbKQwekfUtKCzXl1oQs
 Szzqigv+u5xOOqD5G/377QtCtjMMrYpRPJ7Z8y/52FeU+eeaBw8CiRyWlnilYdO0yqRG
 vvAjPriICxHgf3Wx13sf0UVG89vyOy+/dSZ+VwoHRGHLvBZiRLbvY6j+ElbVjwKLd198
 B6Zh2AdwA2EKRbeOHUHXVuvjJxtTIR00fg81sV0srG8pj6ug1y0SeKY7WoUxTCKJxtTP
 M6Vg==
X-Gm-Message-State: AC+VfDzIeOAVVa+O4jiPbbVGp9k4++e+yXqo7LD2WUJ8AUJt+4mL4/bF
 W42wEDqG+9ptWlNKxZGw8Pb48aBLAqI8icQth5yir1hCosJrtNmsaE3KOsiaKIV1PDAgqNxUWYC
 +L0H/Sb3cy1r4yMJU1V1BxIN2MjS6Yg==
X-Received: by 2002:a05:6214:20a5:b0:620:a1be:c74d with SMTP id
 5-20020a05621420a500b00620a1bec74dmr28799510qvd.37.1683814727299; 
 Thu, 11 May 2023 07:18:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7kKhPUER9WlV6FxRTRY5kG2bve7dq7jZb9RCaxuBPtTMHsv5LQxJyaEf52/qZ9fyyVUCSGGA==
X-Received: by 2002:a05:6214:20a5:b0:620:a1be:c74d with SMTP id
 5-20020a05621420a500b00620a1bec74dmr28799480qvd.37.1683814727011; 
 Thu, 11 May 2023 07:18:47 -0700 (PDT)
Received: from ?IPV6:2601:883:c200:210:6ae9:ce2:24c9:b87b?
 ([2601:883:c200:210:6ae9:ce2:24c9:b87b])
 by smtp.gmail.com with ESMTPSA id
 b8-20020ac812c8000000b003f17f39af49sm2252004qtj.18.2023.05.11.07.18.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 07:18:46 -0700 (PDT)
Message-ID: <bc766d93-8000-5736-64e5-16df4a4a8136@redhat.com>
Date: Thu, 11 May 2023 10:18:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Steven Whitehouse <swhiteho@redhat.com>,
 cluster-devel <cluster-devel@redhat.com>
References: <20230510190818.125286-1-rpeterso@redhat.com>
 <d718cce68afe7db827103dbc4886f4982b1ad83a.camel@redhat.com>
From: Bob Peterson <rpeterso@redhat.com>
In-Reply-To: <d718cce68afe7db827103dbc4886f4982b1ad83a.camel@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH] gfs2: Don't free rgrp clone bitmaps
 until go_inval
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 5/11/23 4:47 AM, Steven Whitehouse wrote:
> Hi,
> 
>> This repeated kmalloc -> kfree -> kmalloc -> kfree is a waste of
>> time:
> 
> It is a waste of time. However, if the clones are kept around for lots
> of rgrps, then that is a waste of space. The question is really what
> the correct balance is.
> 
> Can we not solve the problem at source and prevent the large number of
> lock transitions referred to above? If not then it might be a good plan
> to document why that is the case,
> 
> Steve.

I do believe from a performance perspective, we might benefit just as 
much (if not more) by, for example, using the LM_FLAG_ANY flag when 
acquiring rgrp glocks in SH mode such as gfs2_check_blk_type.
That way if the lock is already in EX, we can just use it rather than 
demote and promote it. There may be other places in the code where we 
can do the same.

 From a correctness perspective, one of my concerns is:
The go_inval() code is only run when transitioning to UN or DF, so 
transitions from EX to SH and back won't call go_inval. They always call 
go_sync, but rgrp_go_sync code exits (and avoids the whole bitmap issue) 
unless the glock is GLF_DIRTY. It just seems fraught with pitfalls. But 
still, it seems to work properly.

I had a meeting with Andreas this morning and we decided that since it 
seems to work, "if it's not broken, don't fix it." So for now, I retract 
the patch and we can readdress the issue if we find problems related to it.

Regards,

Bob Peterson

