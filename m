Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE8C55EB07
	for <lists+cluster-devel@lfdr.de>; Tue, 28 Jun 2022 19:28:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656437283;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8enEY7C1gWoeSidj5O4iKotu18rloK7WpGazqUwbRIY=;
	b=PUbedfzidN25Rj9tfIL9hY8s7i+t0ECQi3IEnllQ5SKqbNnzk9bVT3QDu7qHbXOc7XrdeO
	7R4+AAdZspsLyIjq4FzQOU2i2ox5OxrHo1/e3NTaHhHHMhqxnL3ymi9OvV6R+wTENKEORy
	kFdMhnCa9TjRBb/Qpw+PRSe9WwFOgp0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-AuTath3KMT23Zy-HWF6DLw-1; Tue, 28 Jun 2022 13:27:58 -0400
X-MC-Unique: AuTath3KMT23Zy-HWF6DLw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F57838149A6;
	Tue, 28 Jun 2022 17:27:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 645A62166B26;
	Tue, 28 Jun 2022 17:27:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0BE171947058;
	Tue, 28 Jun 2022 17:27:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 71E9319466DF for <cluster-devel@listman.corp.redhat.com>;
 Tue, 28 Jun 2022 17:27:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5EDAE10725; Tue, 28 Jun 2022 17:27:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AB4F9D63
 for <cluster-devel@redhat.com>; Tue, 28 Jun 2022 17:27:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4023E811E75
 for <cluster-devel@redhat.com>; Tue, 28 Jun 2022 17:27:54 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-wC1HbPUfMxiqWKgh_8aNqA-1; Tue, 28 Jun 2022 13:27:52 -0400
X-MC-Unique: wC1HbPUfMxiqWKgh_8aNqA-1
Received: by mail-ej1-f49.google.com with SMTP id ay16so27232470ejb.6
 for <cluster-devel@redhat.com>; Tue, 28 Jun 2022 10:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8enEY7C1gWoeSidj5O4iKotu18rloK7WpGazqUwbRIY=;
 b=qkA9HvouboDyQLgE9GnLV5kX7nnAAyqVOgZOwId9hqlbO4HTVSzWbuqYBCe2GCHRpa
 ua4BABpcTSpD5dFJTEUTpin4pWSLOW2LUSmO+z75orN6cU643fUkWkZyMneaHEMeDioz
 IEzBRiONgy9IIjLmQdHv5cB5GFjLMTjMH1oTwMApjcBt0kCvA6qKAw48BsPgQIS/09ux
 qT1qACGXFlcjZuLoefllfXpn1L2RgDXXIpSYs3vRiaKa5EvHy36qyPbELkKggBKg1Ph+
 tIasfDKtzV5q+JtQc1GM7Lwbytvs4fR7JLAounkwJmGZ07kEWr+ArFaJZtvW4JDl4d0t
 JEuQ==
X-Gm-Message-State: AJIora/K7TxFeNDbjX3KZhswZRXYyUHrNIFBV0iWil6Ai9p6XCggMMcm
 UF3pcpIHhUWXe2m4FEbGEV1C0s/0Hq82OujNpkQ=
X-Google-Smtp-Source: AGRyM1tcmLits8HLM6nx0zjM93yd0TivtdVmPJVBsqk/gp7EZCmDcYQ5bP7RuzIWSMxceJwbk19/aQ==
X-Received: by 2002:a17:907:cc14:b0:726:3555:ac63 with SMTP id
 uo20-20020a170907cc1400b007263555ac63mr18033559ejc.697.1656437271019; 
 Tue, 28 Jun 2022 10:27:51 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 a4-20020a170906274400b00726b03f83a0sm2467864ejd.33.2022.06.28.10.27.48
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 10:27:49 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id
 o19-20020a05600c4fd300b003a0489f414cso4474146wmq.4
 for <cluster-devel@redhat.com>; Tue, 28 Jun 2022 10:27:48 -0700 (PDT)
X-Received: by 2002:a05:600c:681:b0:3a0:2da6:d173 with SMTP id
 a1-20020a05600c068100b003a02da6d173mr793598wmn.68.1656437268408; Tue, 28 Jun
 2022 10:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAK-6q+hd-L54cqOiFNuufS2_VF5XS0R8cjQL7es8921+2u3uwQ@mail.gmail.com>
 <20220627184232.tjfuzeir57l3h5ll@mail>
 <CAK-6q+haOfQD8_N6pEm80BTrUXwaj07ZBcXP-EBHftpTVEc1XQ@mail.gmail.com>
 <CAK-6q+g795MwPvUGxWXTE+s-TfJnbh2wf=Udb1k7r6ru-4FTMQ@mail.gmail.com>
 <20220628085821.kn3jjrviyprgai4w@mail>
In-Reply-To: <20220628085821.kn3jjrviyprgai4w@mail>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 28 Jun 2022 10:27:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wie9HSY-MmFr9zHeizRTgSfdONop0-4ezBiq5hYNp4U6g@mail.gmail.com>
Message-ID: <CAHk-=wie9HSY-MmFr9zHeizRTgSfdONop0-4ezBiq5hYNp4U6g@mail.gmail.com>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [Cluster-devel] sparse warnings related to kref_put_lock() and
 refcount_dec_and_lock()
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 cluster-devel <cluster-devel@redhat.com>,
 Sparse Mailing-list <linux-sparse@vger.kernel.org>, thunder.leizhen@huawei.com,
 jacob.e.keller@intel.com, Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 28, 2022 at 1:58 AM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> I would certainly not recommend this but ...
> if it's OK to cheat and lie then you can do:
> +       bool refcount_dec_and_lock(refcount_t *r, spinlock_t *lock) __acquires(lock);

Actually, we have "__cond_lock()" in the kernel to actually document
that something takes a lock only in certain conditions.

It needs to be declared as a macro in the header file, with this as an example:

   #define raw_spin_trylock(lock)  __cond_lock(lock, _raw_spin_trylock(lock))

ie that says that "raw_spin_trylock() takes 'lock' when
_raw_spin_trylock() returned true".

That then makes it possible to write code like

    if (raw_spin_trylock(lock)) {..
                 raw_spin_unlock(lock));
    }

and sparse will get the nesting right.

But that does *not* solve the issue of people then writing this as

    locked = raw_spin_trylock(lock);
    .. do_something ..
    if (locked)
                 raw_spin_unlock(lock));

and you end up with the same thing again.

Anyway, for things like refcount_dec_and_lock(), I suspect that first
pattern should work, because you really shouldn't have that second
pattern. If you just decremented without any locking, the actions are
completely different from the "oh, got the last decrement and now it's
locked and I need to free things" or whatever.

                Linus

