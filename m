Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CE65F9C44
	for <lists+cluster-devel@lfdr.de>; Mon, 10 Oct 2022 11:54:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665395682;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=bWAbvwh1HFGHbYSh/eye53qfdD4MoObQPY6foCBLVQs=;
	b=CPKReCYVVv1pPyW/rBPm/vKZWRsYT4ettyMjrGENHtIKZtAm5rZVCUKD+PCFSG1vThg5Ep
	mGOmJWPBsUCULsISinhEZeZkGr9QYuOyahe8QjA37PsMrGMYOLIkZqtvViAkZXr+81GrAP
	/2hZl+5TfKuTl3aPD8mA8loyWYWnXP4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-MZDBmqkkNqKvvyv_u_ZPaA-1; Mon, 10 Oct 2022 05:54:41 -0400
X-MC-Unique: MZDBmqkkNqKvvyv_u_ZPaA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAEFA3C1104C;
	Mon, 10 Oct 2022 09:54:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7AAAC9D492;
	Mon, 10 Oct 2022 09:54:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 239BE1946A5E;
	Mon, 10 Oct 2022 09:54:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B52501946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun,  9 Oct 2022 02:05:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 62480201EC56; Sun,  9 Oct 2022 02:05:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A7D42024CCA
 for <cluster-devel@redhat.com>; Sun,  9 Oct 2022 02:05:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2457A101A5BB
 for <cluster-devel@redhat.com>; Sun,  9 Oct 2022 02:05:29 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-267-1ekiV2_5Nzabt8in03I12g-1; Sat, 08 Oct 2022 22:05:25 -0400
X-MC-Unique: 1ekiV2_5Nzabt8in03I12g-1
Received: by mail-pf1-f173.google.com with SMTP id 204so8024711pfx.10;
 Sat, 08 Oct 2022 19:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bWAbvwh1HFGHbYSh/eye53qfdD4MoObQPY6foCBLVQs=;
 b=kpCLyO8vQ8bW/VUzyEsyBrL8xpP9FfrxINT6XhDmzZPpNYcKRrVrtXBjR7Yzva3EUN
 7mCmRX3GS2Yq7ni4ERGF22LvkYF6F50hnTga93E2cjjnKvfL+V60Vc9UXsMJqpXB9fF1
 RZ4J8o5JNjmxaxLO2JWxTRO1usbIj5ylIaGj3Rr12ab1U9CLqun9sHYg6PICELdsnWv6
 ECYkf2oWfetANYpNyjws1EWlYFE6yll5buO0v7Zyz55lZBY+s9MlyHxQ08k6Cq8rmXvm
 70cxfgadQF1u9MhYNbS6TnkedT0a9DPuSceB6UBq8lFsraFKKf367bpAkD35YpG2uiIE
 Chqg==
X-Gm-Message-State: ACrzQf1Rm5EsFJ4zvNDRxYDt2I0jjhYRAP6zxQOiSrzq9FNt7Vy7i/SC
 S5j3+81ZYzLMVsNtpgsaN48=
X-Google-Smtp-Source: AMsMyM6FzhF+xPf2zKqWMjX+/Hqbe+3OMMa4hx4Pb6Fq6dnCz9xw4pY6AS/0jmR05SWLExWyjdhkng==
X-Received: by 2002:a05:6a00:1343:b0:562:ea5e:57e5 with SMTP id
 k3-20020a056a00134300b00562ea5e57e5mr6159132pfu.45.1665281123314; 
 Sat, 08 Oct 2022 19:05:23 -0700 (PDT)
Received: from mail.google.com (122-58-209-93-fibre.sparkbb.co.nz.
 [122.58.209.93]) by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00537f16e25d3sm4160405pfo.75.2022.10.08.19.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Oct 2022 19:05:22 -0700 (PDT)
Date: Sun, 9 Oct 2022 15:05:17 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Kees Cook <keescook@chromium.org>
Message-ID: <Y0IsXXYnS4DnWkMW@mail.google.com>
References: <Y0IFEUjwXGZFf7bB@mail.google.com>
 <378C6BDE-0A68-4938-86CD-495BD5F35BE6@chromium.org>
MIME-Version: 1.0
In-Reply-To: <378C6BDE-0A68-4938-86CD-495BD5F35BE6@chromium.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Mon, 10 Oct 2022 09:54:37 +0000
Subject: Re: [Cluster-devel] [PATCH v2][next] dlm: Replace one-element array
 with flexible-array member
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 08, 2022 at 05:18:35PM -0700, Kees Cook wrote:
> >$ diff <(objdump -M intel -j .text -D dlm.old) <(objdump -M intel -j
> >.text -D dlm.new)
> 
> I'd suggest different options here, this is harder to map back to the source line.
> See https://outflux.net/blog/archives/2022/06/24/finding-binary-differences/
> for lots of details. :)
> 

Just read the blog entry, it's really interesting. I will be using it
from now onwards :)

> >
> >13778c13778
> ><     c693:	49 8d bc 24 c0 08 00 	lea    rdi,[r12+0x8c0]
> >---
> >>     c693:	49 8d bc 24 c1 08 00 	lea    rdi,[r12+0x8c1]
> 
> This implies something unexpected changed.
> 

I will add more details about this line at the other point you made
below to avoid repeating myself. But to cut a long story, short.. this
[reg + displacement + 1] difference is caused because I deliberately add
the NUL-terminator space to the kzalloc() call.

> This has trailing padding, so the struct size didn't actually change.
> 
> >-	ls = kzalloc(sizeof(struct dlm_ls) + namelen, GFP_NOFS);
> >+	ls = kzalloc(sizeof(struct dlm_ls) + namelen + 1, GFP_NOFS);
> 
> This is allocating 1 more byte than before, since the struct size didn't change. But this has always allocated too much space, due to the struct padding. For a "no binary changes" patch, the above "+ 1" needs to be left off.

That's true. I agree that leaving "+ 1" would work and produce a
no-binary-changes patch due to the existing padding that the structure
has. OTOH, I thought that relying on that space could bite us in the
future if anyone tweaks the struct again...so my reaction was to ensure 
that the NUL-terminator space was always guaranteed to be there.
Hence, the change on c693 (objdump above).

What do you think? Should we keep or leave the above
"+ 1" after the rationale above?

> 
> I would expect the correct allocation size to be:
> offsetof(typeof(*ls), ls_name) + namelen

Fair point, I will make this change.

> 
> Question, though: is ls_name _expected_ to be %NUL terminated

Yes, it is. I tracked down ls_name's utilisations and it is passed down to 
a bunch of routines that expects it to be NUL-terminated such as
snprintf and vsnprintf.

>, and was the prior 3 bytes of extra allocation accidentally required?
> 

I am assuming that you are refering to ls_namelen in the struct dlm_ls
(please correct me if this isn't what you meant).

ls_namelen member is only used within the routine which kzalloc
the space for the struct (fs/dlm/lockspace.c:new_lockspace). 

There are no external references to this member outside of that method in the
kernel. One could say that ls_namelen can be removed without side effects but 
I wouldn't suggest doing it in this patch, that's why I didn't touch it :)

Paulo A.

