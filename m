Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B6F586E6C
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Aug 2022 18:18:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659370679;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=gbhIr0dMzm81+SDBkNEjnMlQtKTmm0VmrGqMRqLxYPs=;
	b=YLJ7hi3YRphlrVE3IXfapTymbPV2yGD9z6U21JtJ5kdJOSFS0KlyLQy89hJoyXRrcbauRW
	ubExOUoYygwc2fYwmeM2r4/rqIIRLMY2QGbCiWogdM/u3d0mgzVL5s8G4cpX3dn4x9oMm4
	VEvQCwfzQ66qABBGBAGkIT3lXWGR+q8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76--MIRwa2fN-aGnidnMjgtlA-1; Mon, 01 Aug 2022 12:17:54 -0400
X-MC-Unique: -MIRwa2fN-aGnidnMjgtlA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 680FE3C01DED;
	Mon,  1 Aug 2022 16:17:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0E21B1121314;
	Mon,  1 Aug 2022 16:17:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D84271946A47;
	Mon,  1 Aug 2022 16:17:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 05CBD1946A40 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  1 Aug 2022 16:17:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E54071121315; Mon,  1 Aug 2022 16:17:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1EF41121314
 for <cluster-devel@redhat.com>; Mon,  1 Aug 2022 16:17:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 954B21C19761
 for <cluster-devel@redhat.com>; Mon,  1 Aug 2022 16:17:50 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-vQ7TVdopNQKtOL-B0V0k7A-1; Mon, 01 Aug 2022 12:17:49 -0400
X-MC-Unique: vQ7TVdopNQKtOL-B0V0k7A-1
Received: by mail-ej1-f50.google.com with SMTP id tl27so3435713ejc.1
 for <cluster-devel@redhat.com>; Mon, 01 Aug 2022 09:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=gbhIr0dMzm81+SDBkNEjnMlQtKTmm0VmrGqMRqLxYPs=;
 b=zSfMzIK2BpLLG+hZODQqUZuQz0uzX1hmeVCxb/K3SUjDpML3fOCLznn/Uy1ff4Q5Tq
 9SaphstI9j1IJUVNmeHPevguZc3RdAGAn00f2peCk7oTHtMDoVLrtts6uJYTuRU+KWDM
 TwOFl3/jKE5H1xEhoJRL63s6/WL/HAsBcL0212SB7HneQM0Fahgenh4mhLf1VU+ySSew
 zouepm3gw2HCrJaQX+O7hrrqMAsY+1BbZsEtcwXxNer/S/lP0KmqskktetS16EV+GjPw
 znfPQry6coil++j0FhGIyYCYKnYdhte/YNDanOLTWXE88EjimkvxJTyBHgAL8GbowMSk
 OEWg==
X-Gm-Message-State: AJIora/pPGasvsNnuoJU19u/AiZ6vumCB3mEnoAIumG4tlleI/fCMErI
 iqqBgCoToEh41Ryd9QmD5wfvmcIlfCfwkqk0sdU=
X-Google-Smtp-Source: AGRyM1vbhyeGJ5qs+7fEac7k4oY0lsv0cnfiQooX3nVMV8nFHS7ZALg9KawuYj7V5ZNVaMYvJuq1gw==
X-Received: by 2002:a17:906:5d16:b0:72f:9f40:d1eb with SMTP id
 g22-20020a1709065d1600b0072f9f40d1ebmr12904847ejt.403.1659370667602; 
 Mon, 01 Aug 2022 09:17:47 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 eg36-20020a05640228a400b0043d2b9b24dfsm5331492edb.18.2022.08.01.09.17.47
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 09:17:47 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id
 b21-20020a05600c4e1500b003a32bc8612fso5825620wmq.3
 for <cluster-devel@redhat.com>; Mon, 01 Aug 2022 09:17:47 -0700 (PDT)
X-Received: by 2002:a05:600c:21d7:b0:3a3:2088:bbc6 with SMTP id
 x23-20020a05600c21d700b003a32088bbc6mr11480857wmj.68.1659370666735; Mon, 01
 Aug 2022 09:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220801144329.GA10643@redhat.com>
 <CAHk-=wgCi2LLzSJg_7nRs+nQbVgT8HwEKzjMae_4geVCA+1SNg@mail.gmail.com>
 <20220801155028.GA12328@redhat.com> <20220801155624.GB12328@redhat.com>
In-Reply-To: <20220801155624.GB12328@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 1 Aug 2022 09:17:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi07ue68JuYXDdPD-s93UTs0Tp0oAvdnyxS3zQQSosEOA@mail.gmail.com>
Message-ID: <CAHk-=wi07ue68JuYXDdPD-s93UTs0Tp0oAvdnyxS3zQQSosEOA@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 1, 2022 at 8:56 AM David Teigland <teigland@redhat.com> wrote:
>
> At risk of compounding your trouble, I could have added that you can use
> the original merge and have me send the fixup.

Well, I only had something like 4 other merges on top, none of them
*that* complicated.

And I hadn't pushed out, so I just redid them.

I did notice your "v2" pull request fairly quickly, because I try to
do my pulls (when I have lots of them, like at the beginning of the
merge window) in some kind of "order of areas", so I was doing
filesystem and vfs stuff, and  your v2 ended up showing up in that
bunch too, and I hadn't done too much.

I doubt I would have needed help with the conflicts, but I decided to
not even look at them, because even with them resolved it would just
have been ugly to have that pointless duplication from the rebase when
I could just start from scratch again.

But again: please don't rebase stuff you have already exposed to
others. It causes real issues. This was just one example of it.

And if you *do* have to rebase for a real technical reason ("Oh, that
was a disaster, it absolutely *must* be fixed"), please let involved
people know asap.

And a version number change is not a "huge disaster, must rebase".

           Linus

