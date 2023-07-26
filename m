Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 493C1763C22
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jul 2023 18:15:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690388154;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WL5UzlACeidu3wr0b3uvqHzNECinmUPyPdtvxBbLLlg=;
	b=IkJnYwOuSH9vcEPvfCkbhUC3XGD/AuRuKcEsO+Iwk4ij/xO4T1rXNCkWid2dRUCTbHVq6s
	7R+56y8mWOzt8j5BFvYOvwhc5SCgsfzN2T+pTqKynkdMe2pdGpoxg4HlgRkJEoL/n6u1GI
	61jIyI8MgFvRNZAF8jCq9pt4VGmrtUE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-WeYVDthqNFuS5in0Oc_KGQ-1; Wed, 26 Jul 2023 12:15:50 -0400
X-MC-Unique: WeYVDthqNFuS5in0Oc_KGQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14DDB8028B2;
	Wed, 26 Jul 2023 16:15:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CB22B492B01;
	Wed, 26 Jul 2023 16:15:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 67937193F504;
	Wed, 26 Jul 2023 16:15:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8AD821946A6C for <cluster-devel@listman.corp.redhat.com>;
 Wed, 26 Jul 2023 16:14:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6DEE4C2C7D3; Wed, 26 Jul 2023 16:14:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66C78C2C858
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 16:14:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 319CD29ABA02
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 16:14:10 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-L5V3I18vNGmnPAUDJaLWnA-1; Wed, 26 Jul 2023 12:14:08 -0400
X-MC-Unique: L5V3I18vNGmnPAUDJaLWnA-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-768270326b8so814774185a.2
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 09:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690388048; x=1690992848;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WL5UzlACeidu3wr0b3uvqHzNECinmUPyPdtvxBbLLlg=;
 b=D/6g6tI7iumn2lb/Jbtvz6ZagO3AtwF0c2aeB2tyKep74W5L0kq6ci2bgMoftvLHQk
 mZ6IjzEPkAnD+mk7JnIc6Ohc6cw94zbDwdP2Lh+TzWt9BqRz0VuH/UliAg3bTxp/VgsC
 Ilb754uyhANRQrwe+UK9tKwqF6C0tPF5Hmw0nM6nMxp5a3TDmXFXTfrn1S2BmFJyBCVT
 PBMsEgvDsye5IlidA30vPqE4hv+o7ovdwL1LU2+zV27nRPbrRamGViTv4K8OGtfA9bKY
 mwyVjFOEHbnSBEKBNyjyej9kyhfbpqS7walIyM0AikTv6sn8Fx3xi1bzTZgwYAo3gToc
 Q/HA==
X-Gm-Message-State: ABy/qLazRkdG4lDupHt9HYpjdmjdHTpujblDzMLqaKSQEa0oHX8AYwYR
 AZdtpLMJJdHilWlnIK3fE8koWNxBfNq07ELrho1H6Vn+WF0GkmyxGn2ONeAdHaKDJxgPlg43GDz
 AGl071KQcQLHOSOldhCNtZA==
X-Received: by 2002:a05:620a:4089:b0:767:954:a743 with SMTP id
 f9-20020a05620a408900b007670954a743mr3500638qko.51.1690388047928; 
 Wed, 26 Jul 2023 09:14:07 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEfBpqLPPyPIiWG0ac0boS5hjFeMPTr/l8604lcZrWS1ytdXC3hfKwjiOVZf183dDkNAGxAnA==
X-Received: by 2002:a05:620a:4089:b0:767:954:a743 with SMTP id
 f9-20020a05620a408900b007670954a743mr3500618qko.51.1690388047685; 
 Wed, 26 Jul 2023 09:14:07 -0700 (PDT)
Received: from [172.16.0.7] ([209.73.90.46]) by smtp.gmail.com with ESMTPSA id
 g22-20020a37e216000000b007677f66b160sm4450582qki.124.2023.07.26.09.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 09:14:07 -0700 (PDT)
Message-ID: <b3c92f88-4fb7-c4ee-e1a2-8f38150d7edd@redhat.com>
Date: Wed, 26 Jul 2023 11:14:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: syzbot <syzbot+3f6a670108ce43356017@syzkaller.appspotmail.com>,
 agruenba@redhat.com, andersson@kernel.org, cluster-devel@redhat.com,
 dmitry.baryshkov@linaro.org, eadavis@sina.com, konrad.dybcio@linaro.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <0000000000009655cc060165265f@google.com>
From: Bob Peterson <rpeterso@redhat.com>
In-Reply-To: <0000000000009655cc060165265f@google.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [syzbot] [gfs2?] KASAN: use-after-free Read in
 qd_unlock (2)
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
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/26/23 10:03 AM, syzbot wrote:
> syzbot suspects this issue was fixed by commit:
> 
> commit 41a37d157a613444c97e8f71a5fb2a21116b70d7
> Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Date:   Mon Dec 26 04:21:51 2022 +0000
> 
>      arm64: dts: qcom: qcs404: use symbol names for PCIe resets
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17b48111a80000
> start commit:   [unknown]
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=fe56f7d193926860
> dashboard link: https://syzkaller.appspot.com/bug?extid=3f6a670108ce43356017
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1209f878c80000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=111a48ab480000
> 
> If the result looks correct, please mark the issue as fixed by replying with:
> 
> #syz fix: arm64: dts: qcom: qcs404: use symbol names for PCIe resets
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 
The bisect is very likely to be wrong.

I have a lot of patches to gfs2's quota code in linux-gfs2/bobquota that 
I hope to get into the next merge window, but the critical patch has 
already been merged. I'm still working on others.

Regards,

Bob Peterson
gfs2 file system

