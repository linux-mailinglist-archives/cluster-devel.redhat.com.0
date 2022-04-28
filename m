Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E5762513AC1
	for <lists+cluster-devel@lfdr.de>; Thu, 28 Apr 2022 19:22:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651166531;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=5zUbyOsP3xAYJ4at2YNe/KyTjVNVtkCIzWhlQOjPf5A=;
	b=DtYiKYNrek8yw0NmELaFfHlHT5dTBqnsiJiY3jCS2c+WD3qJfmVEZKSjckQNVauj+I3HBl
	pbI+7FNcD2eT6kvxfDgWYC2k6Ib9u2qWRlEFdMWbXrwFv2E2n8pOLUhnRYU9+Aj1PYIIrB
	4ScUQZ7SkZ+iREz48zhygxB8UmshjME=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-YeIylfRhOWqC-nrEb5IymA-1; Thu, 28 Apr 2022 13:22:08 -0400
X-MC-Unique: YeIylfRhOWqC-nrEb5IymA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3E8A802809;
	Thu, 28 Apr 2022 17:22:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B846A574764;
	Thu, 28 Apr 2022 17:22:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7C21D1947048;
	Thu, 28 Apr 2022 17:22:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F231219466DF for <cluster-devel@listman.corp.redhat.com>;
 Thu, 28 Apr 2022 17:22:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CCB40574764; Thu, 28 Apr 2022 17:22:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C88D8574766
 for <cluster-devel@redhat.com>; Thu, 28 Apr 2022 17:22:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9802080005D
 for <cluster-devel@redhat.com>; Thu, 28 Apr 2022 17:22:06 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-_MvBb62YNBWJnA7qrgjZGA-1; Thu, 28 Apr 2022 13:22:05 -0400
X-MC-Unique: _MvBb62YNBWJnA7qrgjZGA-1
Received: by mail-wm1-f71.google.com with SMTP id
 h65-20020a1c2144000000b0038e9ce3b29cso4649161wmh.2
 for <cluster-devel@redhat.com>; Thu, 28 Apr 2022 10:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5zUbyOsP3xAYJ4at2YNe/KyTjVNVtkCIzWhlQOjPf5A=;
 b=c1shtEs4NYlh0kY6bALergJInvhMquI2uXGLOHoy8Scgrym4K+UVZjLxEbpYcVx0UE
 J/cOF2g34o0tl/ohXF3o1WCE+Wgy3zp5AFsoSpM0oI8QTZ3r4EqFJGBQY+dXvntXsbIv
 ConR8LNiQXR1fiSeOYYf5HmXnPEL7wqs15ONO32PfGdYlgpqDYtSUhkvjs0FUJIThy/3
 Px3OlmGeW39+1wj3qLDZU0d1e//6ayG98L6iYtESRLBmeX195HLvpaDp6V92riAPIcL7
 /S+q2aR2AqQaF+XKmbd6qlR6L/xCYZgzYe51Mkz02YOs+rNDfJxzbBUvI8UdIeSEJ5Rc
 6sIA==
X-Gm-Message-State: AOAM5308UDP1nJm16ZB3FWu8ABYScI/i45uz0EKsRe5AQJEQxKpXGCbg
 lLKC1AFXW+gu8OsG6S6srs71niFNnFHVFtRAK/8wNdZNrGkOFrPXZblFXmAHNiFDEoNuMLY8g7r
 xnBOUmY6w8WRJr2jpywWoUppKOCfIiVuC+iwjLA==
X-Received: by 2002:a7b:cbc1:0:b0:38e:7c42:fe38 with SMTP id
 n1-20020a7bcbc1000000b0038e7c42fe38mr42293405wmi.51.1651166523724; 
 Thu, 28 Apr 2022 10:22:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1WHHnyNchm0evBJjli2hIERYWmATR8AuMBS2O4OAvhOhqFZ1txvtVXuGj6QuHPITPFTOhS7Tb7HCQXbPNXho=
X-Received: by 2002:a7b:cbc1:0:b0:38e:7c42:fe38 with SMTP id
 n1-20020a7bcbc1000000b0038e7c42fe38mr42293394wmi.51.1651166523551; Thu, 28
 Apr 2022 10:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220426145445.2282274-1-agruenba@redhat.com>
 <CAHk-=wi7o+fHYBTuCQQdHD112YHQtO21Y3+wxNYypjdo8feKFg@mail.gmail.com>
 <CAHc6FU48681X8aUK+g7UUN7q5b6rkVBzTP7h_zbE4XqZYAiw3g@mail.gmail.com>
 <CAHk-=wjMB1-xCOCBtsSMmQuFV9G+vNyCY1O_LsoqOd=0QS4yYg@mail.gmail.com>
 <CAHc6FU5Bag5W2t79+WzUq=NibtEF+7z6=jyNCkLMMp9Yqvpmqw@mail.gmail.com>
 <CAHk-=whaz-g_nOOoo8RRiWNjnv2R+h6_xk2F1J4TuSRxk1MtLw@mail.gmail.com>
 <CAHc6FU5654k7QBU97g_Ubj8cJEWuA_bXPuXOPpBBYoXVPMJG=g@mail.gmail.com>
 <CAHk-=wgSYSNc5sF2EVxhjbSc+c4LTs90aYaK2wavNd_m2bUkGg@mail.gmail.com>
 <CAHc6FU69E4ke4Xg3zQ2MqjLbfM65D9ZajdY5MRDLN0azZOGmVQ@mail.gmail.com>
 <CAHk-=whQxvMvty8SjiGMh+gM4VmCYvqn6EAwmrDXJaHT2Aa+UA@mail.gmail.com>
 <CAHk-=wicJdoCjPLu7FhaErr6Z3UaW820U2b+F-8P4qwSFUZ0mg@mail.gmail.com>
 <CAHc6FU7GkXLkns5PONLvsSi6HB+rjaNSyFeQFS034tKL-JueMw@mail.gmail.com>
 <CAHk-=wg4ypnZUA5BOHAF1miKvOhW2yQSruuBKNXMDR=dTmp+ww@mail.gmail.com>
 <CAHk-=wiF8D6Bs2m8y85XpHU__c4XD1yFV9JXx9FuTqoge+-yhg@mail.gmail.com>
In-Reply-To: <CAHk-=wiF8D6Bs2m8y85XpHU__c4XD1yFV9JXx9FuTqoge+-yhg@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 28 Apr 2022 19:21:52 +0200
Message-ID: <CAHc6FU5Et7bh7zOQTSqBjmRAdB3Hibk8xwXG_YVs_VRXVh8iFA@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 fix
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
Cc: cluster-devel <cluster-devel@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 28, 2022 at 7:17 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Thu, Apr 28, 2022 at 10:09 AM Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >
> > I'll look at that copy_page_to_iter_iovec() some more regardless, but
> > doing that "let's double-check it's not somethign else" would be good.
>
> Oh, and as I do that, it strikes me: What platform do you see the problem on?
>
> Because the code for that function is very different if HIGHMEM is
> enabled, so if you see this on x86-32 but not x86-64, for example,
> that is relevant.
>
> I *assume* nobody uses x86-32 any more, but just checking...

This is on x86_64.

Andreas

