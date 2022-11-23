Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BF922636153
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Nov 2022 15:17:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669213070;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=HVSKF0YEcutduq/n8rv06TUhVfzj6CviBu1s4EiRloE=;
	b=FfR2LlGERrE5oBsiSTIcmmyImHUzhCxZmxjiVFlPvIPdYFMndpv7laoODV13dU8P3rCRL1
	0nq6q8qHaVFZ694xCFldbNDiH6/anMmrhkLlzKrNvVV4Eq2X4L1zkmpT8zF6UZpgPIJ9+4
	tplPXQ5oDxz9nG82U+u46FahlKfMYjw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-jRPUEZqKP1mGRsdcGmKq4Q-1; Wed, 23 Nov 2022 09:17:46 -0500
X-MC-Unique: jRPUEZqKP1mGRsdcGmKq4Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAFDF85A5B6;
	Wed, 23 Nov 2022 14:17:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DA3CCC1908A;
	Wed, 23 Nov 2022 14:17:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B78BF194658F;
	Wed, 23 Nov 2022 14:17:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9D8691946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 23 Nov 2022 13:50:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7D52E2166B37; Wed, 23 Nov 2022 13:50:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76E092166B31
 for <cluster-devel@redhat.com>; Wed, 23 Nov 2022 13:50:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58BAC862FDF
 for <cluster-devel@redhat.com>; Wed, 23 Nov 2022 13:50:08 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-318-3OkOqCuhOo2Sq7f4ia7D4Q-1; Wed, 23 Nov 2022 08:50:06 -0500
X-MC-Unique: 3OkOqCuhOo2Sq7f4ia7D4Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 y18-20020a056402359200b004635f8b1bfbso10521512edc.17
 for <cluster-devel@redhat.com>; Wed, 23 Nov 2022 05:50:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HVSKF0YEcutduq/n8rv06TUhVfzj6CviBu1s4EiRloE=;
 b=CCDJ8d7v3LzopB3wQMz8V1gXecHEAfxKNVEhKwdSYclOq0u7qjVMOINtkkkgwf88nU
 JS47yvNqGkTN09vGVzLUGJCVo+J/ovqrfVlmf72tDxfN3pTt3fzKtC2gTuBHyrxmemk7
 4he4jfnL4+9/EzQitSOHrwgEv3yPNpB4fcIUKDeR97mRFiCtoryOqMuQvpYF0gEaZrrq
 tdvbDvuiTUH/1wCQhJJ/VQIc/BYqq448JQ9/EhnHgf9JJdRvg+3BKGgj07e2mzSltYde
 6Q2+RRAkp2C4nNJ0irWziUa0oJHtQ+U16dE6ns/efICLFjmkbdXUGUa/cpFGx2HGLV3U
 7q0Q==
X-Gm-Message-State: ANoB5pnvX8j2xbXtgXKWDQeKhSeonKe4RgtSro2zl86yLF5CpYcXcHRv
 /Rpl3Lw4jFdZTpxyJ7PdT0ttM4wiU9uJzj9nlmM8yUK4e/RKJ/hftrpfeN41gKy+jNGa84XwRsJ
 H9hhp2xQ2iOOENdrDR+37VnaDEIx0S3eyTDqbsg==
X-Received: by 2002:a17:906:16d4:b0:7b9:f0fd:47b1 with SMTP id
 t20-20020a17090616d400b007b9f0fd47b1mr2402061ejd.462.1669211405873; 
 Wed, 23 Nov 2022 05:50:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7TcDEb99zr9yX79Qu7+GTLJM7BVi7LV+y79ONebrgHXbpuPdta2f2Ab9rl1yKFfhdFHqVDQHahSKGbYN9YYVY=
X-Received: by 2002:a17:906:16d4:b0:7b9:f0fd:47b1 with SMTP id
 t20-20020a17090616d400b007b9f0fd47b1mr2402053ejd.462.1669211405724; Wed, 23
 Nov 2022 05:50:05 -0800 (PST)
MIME-Version: 1.0
References: <20221123065319.56756-1-zhengyongjun3@huawei.com>
 <CAK-6q+gWK3g-g+6ox240hEmVQu2xjq4ZfxGdO9AHoqKG-5Myfw@mail.gmail.com>
In-Reply-To: <CAK-6q+gWK3g-g+6ox240hEmVQu2xjq4ZfxGdO9AHoqKG-5Myfw@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 23 Nov 2022 08:49:54 -0500
Message-ID: <CAK-6q+gb074RyyfVnbkeQWiY7FDQf0j-jwJ0LfmM8ojafwy7-w@mail.gmail.com>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH -next] fs: dlm: Fix build error without
 DEBUG_LOCK_ALLOC
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
Cc: cluster-devel@redhat.com, zhengbin13@huawei.com,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, Nov 23, 2022 at 8:39 AM Alexander Aring <aahringo@redhat.com> wrote:
>
> Hi,
>
> On Wed, Nov 23, 2022 at 8:37 AM Zheng Yongjun <zhengyongjun3@huawei.com> wrote:
> >
> > If CONFIG_DLM is y, DEBUG_LOCK_ALLOC is n, building fails:
> >
> > fs/dlm/lowcomms.o: In function `lowcomms_queue_rwork':
> > lowcomms.c:(.text+0x2ac): undefined reference to `lockdep_is_held'
> > lowcomms.c:(.text+0x308): undefined reference to `lockdep_is_held'
> > fs/dlm/lowcomms.o: In function `lowcomms_queue_swork':
> > lowcomms.c:(.text+0x3e0): undefined reference to `lockdep_is_held'
> > fs/dlm/lowcomms.o: In function `restore_callbacks':
> > lowcomms.c:(.text+0xd8c): undefined reference to `lockdep_is_held'
> > lowcomms.c:(.text+0xdcc): undefined reference to `lockdep_is_held'
> >
> > Make DLM select DEBUG_LOCK_ALLOC to fix this.
> >
>
> Thanks, there is a different approach already in dlm/next and I think
> we don't want to have dlm selecting a debug option.

btw. I am curious why lockdep defines a prototype and not an
implementation for it if LOCKDEP is not set. In my opinion there
should be some no-op functions for it that the compiler puts it out if
it's not set. Then we don't end in #idefs inside the implementation...

- Alex

