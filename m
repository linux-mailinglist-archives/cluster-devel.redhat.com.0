Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEBB6C7312
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Mar 2023 23:27:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679610468;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ipH/7qh/XsDMwmrIBayEKIi9rym0oDV+8Lji6rbxIoY=;
	b=PLO5B4mmIsJThHrbjrvzZmiXg1yUQx6mkrF0PBcdosyF0pG4iMZNZfebDd/xWF78PMF8aE
	ntaWOszopOa7cggO9K772xWCJHnqEGnNhLq7gF3XXtpFZfakgvMMzbp9A4MiEpq3m5uw6G
	WsgVCYmZfmt7L9LMSty9FPmacL4ZGgE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-muFSyMtlP8-6yqIOVHEibg-1; Thu, 23 Mar 2023 18:27:44 -0400
X-MC-Unique: muFSyMtlP8-6yqIOVHEibg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70708855304;
	Thu, 23 Mar 2023 22:27:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 60A171121314;
	Thu, 23 Mar 2023 22:27:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4779819465BB;
	Thu, 23 Mar 2023 22:27:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B693C1946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 23 Mar 2023 22:27:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A6948492B0C; Thu, 23 Mar 2023 22:27:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EA13492B0B
 for <cluster-devel@redhat.com>; Thu, 23 Mar 2023 22:27:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84238185A78B
 for <cluster-devel@redhat.com>; Thu, 23 Mar 2023 22:27:41 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-g9Ws-tJPNs-SP7tVStwS0g-1; Thu, 23 Mar 2023 18:27:37 -0400
X-MC-Unique: g9Ws-tJPNs-SP7tVStwS0g-1
Received: by mail-ed1-f41.google.com with SMTP id y4so1057857edo.2
 for <cluster-devel@redhat.com>; Thu, 23 Mar 2023 15:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679610455;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ipH/7qh/XsDMwmrIBayEKIi9rym0oDV+8Lji6rbxIoY=;
 b=s8kt25FiVVo3E9x9HuZufqK53MQTkBtLiWZM5+9SaUBXvgLrWdQhu7b4FUT/gf8wXz
 dOFaMwvGUuzBEQqo6lUx6K9i5al/9jGCglie1N+oQe+D0d3keZ0Lx6nSUiYl2N9wBetq
 eNtJiU2N/oq5rNss7+EWpqiP3SOCaEwM5Jodm8wdFcC6wYRZ8pT4opTv84KTRpD+tACi
 rcOkYV67epotF0Yqh45ZF+hQ7gho8TXV5PqPcqzxcwPaWBhhPGzIZFMu+2hDCmj1TyAz
 4EXymVHgSR3u42anuc8bmSV6ilKW9WaeXoXTz/FwDF3hoLLvEiZ1xkS45g4TeVrLwzHJ
 gXYQ==
X-Gm-Message-State: AAQBX9fv93/1mbmH1lLLYwMTdACoOwAe5BwaAZ8AvkBA8SMg55ZgOveb
 L1jzy30QaD1H9PnBI6ker5whkQZ0V5951517ojLqVg==
X-Google-Smtp-Source: AKy350Z84XY1i9p2Z+mNdXfyAzOtFQK4oWExf7laFpLQM/RQ0hZmE7aPvuUbS5Q7fTb4pWdFcSdQKA==
X-Received: by 2002:a17:906:b1d9:b0:931:6f5b:d280 with SMTP id
 bv25-20020a170906b1d900b009316f5bd280mr466420ejb.17.1679610455441; 
 Thu, 23 Mar 2023 15:27:35 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 o23-20020a170906289700b00922547486f9sm9424332ejd.146.2023.03.23.15.27.34
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 15:27:34 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id y4so1057663edo.2
 for <cluster-devel@redhat.com>; Thu, 23 Mar 2023 15:27:34 -0700 (PDT)
X-Received: by 2002:a50:c343:0:b0:4fa:cef4:a27f with SMTP id
 q3-20020a50c343000000b004facef4a27fmr537410edb.2.1679610454511; Thu, 23 Mar
 2023 15:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230323184537.749868-1-agruenba@redhat.com>
 <CAHk-=whms=0Cvmk946a0Pebv1YLWiuYCjyVy6yNeBp55+R8sMw@mail.gmail.com>
 <CAHpGcMKO-C=+wPprBGnOLeA+6_PJhHatO3fANizXNAtG2kYRcA@mail.gmail.com>
In-Reply-To: <CAHpGcMKO-C=+wPprBGnOLeA+6_PJhHatO3fANizXNAtG2kYRcA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 Mar 2023 15:27:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiadgd7wJZiRptyMrQ22gCbyOFGqybX9sp=4gqewnMszQ@mail.gmail.com>
Message-ID: <CAHk-=wiadgd7wJZiRptyMrQ22gCbyOFGqybX9sp=4gqewnMszQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 fix for v6.3-rc4
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 3:22=E2=80=AFPM Andreas Gr=C3=BCnbacher
<andreas.gruenbacher@gmail.com> wrote:
>
> I've pushed the tag out now; should I resend the pull request?

No, all good, I have the changes,

                Linus

