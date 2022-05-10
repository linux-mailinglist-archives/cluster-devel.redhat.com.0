Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4875220E3
	for <lists+cluster-devel@lfdr.de>; Tue, 10 May 2022 18:16:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652199413;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=KVzPa/CpMbrLak9Ttn+hwPBIcEYZnOC0Ik+6YZOOMwE=;
	b=WXxNJL4KvJmPBegdBQyqw96QMfOg+xPdw0FVvdtQGuSEIfZh+NtJ5XUnr6FiHKntngA6MF
	Ya7fJbVtl3ws7KbsJ4oKI45tXZdtHA/AtrbBFwABy8wKEB3zg9iRXkqYJ43GcW32TMhceW
	Csw+fdQLuNjjbmVaRGYODov0frDQg5Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-Snz75n25Ohe6Yz84bUEEQw-1; Tue, 10 May 2022 12:16:50 -0400
X-MC-Unique: Snz75n25Ohe6Yz84bUEEQw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 024EB101AA45;
	Tue, 10 May 2022 16:16:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AA6B4C27E91;
	Tue, 10 May 2022 16:16:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 84177194705D;
	Tue, 10 May 2022 16:16:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9B2FC194704D for <cluster-devel@listman.corp.redhat.com>;
 Tue, 10 May 2022 16:16:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7D1B315156EE; Tue, 10 May 2022 16:16:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79ADF15156E9
 for <cluster-devel@redhat.com>; Tue, 10 May 2022 16:16:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6124F811E80
 for <cluster-devel@redhat.com>; Tue, 10 May 2022 16:16:46 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-RhXhU2syNwKetKHm4AwzwA-1; Tue, 10 May 2022 12:16:43 -0400
X-MC-Unique: RhXhU2syNwKetKHm4AwzwA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v191-20020a1cacc8000000b0038ce818d2efso5469428wme.1
 for <cluster-devel@redhat.com>; Tue, 10 May 2022 09:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KVzPa/CpMbrLak9Ttn+hwPBIcEYZnOC0Ik+6YZOOMwE=;
 b=CX7nPUwYM0t+7+DcVtDGnxvHBABNAIrW6/BVsPtSLoJfsoczzpoXJ9NDYUrSw5W0qW
 eFuaa5v9fgh/cPotezEQiVHzdt/JtO6m0OULaKwsE1sBM6KXElmoUkWuN+uGA5P7oll6
 j1TWeHHIcTP3kuSCsFHOtSe95S3t3F0HW+1tj3M7Hu1sNDhuhRpnhNmFezr8Xohe3+OC
 e4b42Dl9hr5HGvVzJtFsda/ur8zXMN1XXs7XZ8U7LwqKbpiXvUkM/uU9GtAumFPxrfhb
 T3PRj9BwJdsoSUmA5kPYQpeoQGRrDT7Kc8bpq7uOQhrX4tABQ6GDR/vvqXKeJalC/rqO
 50uA==
X-Gm-Message-State: AOAM533pnCJC/qDeyGMrkdBGSEH/51G7mSMB1xix3JC9HV9oPRNG3z2R
 qSoDYapwBYdr8Ka26fX28k8Mnabih2O55lYDiLvVrK+52VhXczLOcwBM9xlfIZUOiBwn7F50vt6
 B6k1NDroZcxnRDvD8GcV6ZnRjGyERKDArA6nxng==
X-Received: by 2002:a5d:5547:0:b0:20c:7a44:d8e7 with SMTP id
 g7-20020a5d5547000000b0020c7a44d8e7mr19631571wrw.349.1652199401966; 
 Tue, 10 May 2022 09:16:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDB7CHCX//1BDK27DcKh4uB1maI9l/Yz+/1MPCRVN3bchRD2R7xPAgn4zma5TWUgVosDoprwxWUYpGT9gU6g0=
X-Received: by 2002:a5d:5547:0:b0:20c:7a44:d8e7 with SMTP id
 g7-20020a5d5547000000b0020c7a44d8e7mr19631556wrw.349.1652199401831; Tue, 10
 May 2022 09:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220508100630.2642320-1-keescook@chromium.org>
 <YnoQmuPgK9c5V8ZC@infradead.org>
 <CAHc6FU5VfS9yNe0yH_sfOt04rvii6T_NMq7kp+32HZa5XQDtEA@mail.gmail.com>
 <202205100851.663310B@keescook>
In-Reply-To: <202205100851.663310B@keescook>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 10 May 2022 18:16:30 +0200
Message-ID: <CAHc6FU4hRBHUJOCF33z=dzOJszYCpiZ=wikdyXZ1u25hGQ00ng@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH] gfs2: Use container_of() for
 gfs2_glock(aspace)
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 cluster-devel <cluster-devel@redhat.com>, kernel test robot <lkp@intel.com>,
 Tom Rix <trix@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Bill Wendling <morbo@google.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Kees,

On Tue, May 10, 2022 at 5:51 PM Kees Cook <keescook@chromium.org> wrote:
> Thanks! So I should leave this with you to arrange, or should I send an
> updated patch?

are you happy with this?

https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/commit/?id=833ab609b94f6

Thanks,
Andreas

