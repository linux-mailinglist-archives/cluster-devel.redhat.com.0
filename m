Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA31D586E06
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Aug 2022 17:46:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659368810;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=FKWfV0YKdSbGcGL8JfBr05jog3rOXyTHkyO18qbmTgI=;
	b=FE/8YoG3e1hhQekcLIKMIbReQ4s8dzHjFxJ+/HIZWNaLpAq/Ewcjotm5tdTm+DvP5xGX7B
	l3zdX40ALVSDHWD3OD7SYMVHsIAmi0+rocTm+zMQgiWPFWzzVa5i8zM4zbAHThHZvFDMDV
	J1ahJQDhkcdxASKQVzkgYTckTeCJCxA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-oDhm3ic8MsO1tP9lZdwMGg-1; Mon, 01 Aug 2022 11:46:46 -0400
X-MC-Unique: oDhm3ic8MsO1tP9lZdwMGg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76F72811E75;
	Mon,  1 Aug 2022 15:46:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79D0D906B9;
	Mon,  1 Aug 2022 15:46:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 476FC1946A47;
	Mon,  1 Aug 2022 15:46:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E67721946A40 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  1 Aug 2022 15:46:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DA70840CFD0A; Mon,  1 Aug 2022 15:46:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6CB240CF8ED
 for <cluster-devel@redhat.com>; Mon,  1 Aug 2022 15:46:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF23218812C8
 for <cluster-devel@redhat.com>; Mon,  1 Aug 2022 15:46:42 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-ACDMgdn1PnuTkZyBrFgnHg-1; Mon, 01 Aug 2022 11:46:41 -0400
X-MC-Unique: ACDMgdn1PnuTkZyBrFgnHg-1
Received: by mail-oi1-f175.google.com with SMTP id u9so13457795oiv.12
 for <cluster-devel@redhat.com>; Mon, 01 Aug 2022 08:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=FKWfV0YKdSbGcGL8JfBr05jog3rOXyTHkyO18qbmTgI=;
 b=4DsFIWclzLbs9oCbXeqB5DFVdvOL0utbeAdHX0YQHuy2ZIIW8zR6+e++MwT/tiE+p8
 U4Bi2FwLQ+D0GyWXJ5HoxK81x10ozYJqMRiMb2ZxQpoHBeVa7sexdbxcEHJEzXA6h6pJ
 f18JT6/SrYe14qyFoG3ikOkG3/Febb8zbXLdLR82lkWehViHKCyV82N2uoUoj++bmYKf
 PVOhXzN8Q4rY4d+NtScYRDeVW8NHVAu8JuJbr5TCyPIdfAsgCGvq1b/kH8TRBsolrd/q
 fC5FdNwUEz0WUVxE1EZSVcIOyBAsuqIxyhJ+0zOI0HkffnrnjnJCvb001H1i17qjwmCx
 N+pg==
X-Gm-Message-State: AJIora91deMHG2sjzAondcgUill9gl6lhN+Ri/Js0kOkf+/e7L5QszcJ
 ly0hhtJ/czOV6MnsTc09Ovf4XrIwy0H+CbnBgow=
X-Google-Smtp-Source: AGRyM1vFBrZUoQtSE/HVrke0MRHjRSqt2DptwpE2M9gTgfOaEYAPIdzIc/dLEzY8vTD8XgQMU+Uvxw==
X-Received: by 2002:aca:e0d7:0:b0:33a:afba:2cd7 with SMTP id
 x206-20020acae0d7000000b0033aafba2cd7mr6405404oig.81.1659368800155; 
 Mon, 01 Aug 2022 08:46:40 -0700 (PDT)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com.
 [209.85.160.44]) by smtp.gmail.com with ESMTPSA id
 fq7-20020a0568710b0700b0010c3655967csm3116871oab.40.2022.08.01.08.46.39
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 08:46:39 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-10ea7d8fbf7so8932781fac.7
 for <cluster-devel@redhat.com>; Mon, 01 Aug 2022 08:46:39 -0700 (PDT)
X-Received: by 2002:a05:6870:65a7:b0:10e:d8ab:dd79 with SMTP id
 fp39-20020a05687065a700b0010ed8abdd79mr2693975oab.53.1659368799695; Mon, 01
 Aug 2022 08:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220801144329.GA10643@redhat.com>
In-Reply-To: <20220801144329.GA10643@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 1 Aug 2022 08:46:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgCi2LLzSJg_7nRs+nQbVgT8HwEKzjMae_4geVCA+1SNg@mail.gmail.com>
Message-ID: <CAHk-=wgCi2LLzSJg_7nRs+nQbVgT8HwEKzjMae_4geVCA+1SNg@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Cluster-devel] [GIT PULL] dlm updates for 6.0
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 1, 2022 at 7:43 AM David Teigland <teigland@redhat.com> wrote:
>
> (You can ignore the premature 5.20 pull request from some weeks ago.)

Gaah. That was the first thing I pulled this morning because it was
the earliest.

And apparently you've rebased, so I can't even just pull on top.

Gaah. Now I'll have to go back and re-do everything I've done this morning.

PLEASE don't do things like this to me. If you know you are going to
re-do a pull request, let me know early, so that I don't pull the old
one.

                  Linus

