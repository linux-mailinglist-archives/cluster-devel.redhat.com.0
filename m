Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DF1562058
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Jun 2022 18:34:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656606893;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=bMOwDWIfg0entuc2l+NsGII8SSnnX37Y724/yrdR39A=;
	b=QfyMqklD17AdMMHY2per5RyKXaD3IkwVMSm4uK6ZfwlnB3xDz/OSnFGpqIyQiD87w8Mn5P
	22gKkMClBE3qMFDl+TIJWut6f7xhCm1X1TW5D/HFMk73Jo2k+2Tz8kQGr8wloixi/TF0Ja
	fQXAx+v2zVQ7CZQ4x5UKJM7sYqjKqRc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-SRXUrgq3MqOjqXmXfvdg1g-1; Thu, 30 Jun 2022 12:34:50 -0400
X-MC-Unique: SRXUrgq3MqOjqXmXfvdg1g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F37DE185A7A4;
	Thu, 30 Jun 2022 16:34:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D45351121314;
	Thu, 30 Jun 2022 16:34:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 95C941947064;
	Thu, 30 Jun 2022 16:34:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6B54A194704E for <cluster-devel@listman.corp.redhat.com>;
 Thu, 30 Jun 2022 16:34:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4BA4A41637B; Thu, 30 Jun 2022 16:34:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 463C2415F5E
 for <cluster-devel@redhat.com>; Thu, 30 Jun 2022 16:34:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 295CE101A588
 for <cluster-devel@redhat.com>; Thu, 30 Jun 2022 16:34:44 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-pw13nBn1NL2q9rKS4Xykug-1; Thu, 30 Jun 2022 12:34:34 -0400
X-MC-Unique: pw13nBn1NL2q9rKS4Xykug-1
Received: by mail-ej1-f49.google.com with SMTP id fw3so12425191ejc.10
 for <cluster-devel@redhat.com>; Thu, 30 Jun 2022 09:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bMOwDWIfg0entuc2l+NsGII8SSnnX37Y724/yrdR39A=;
 b=iAXQKrk9OmsLYPsAurddEP/v+QqddLfU3rMFZLEuVeQx9wAI8C5MTu+EtHfQ36+y3u
 EC9eR7ql8Xbbhm7lpvYEhwtCsYhmIzc1mvKn/pWvW2JlInoa4kW1XfE3L6j+8g1k970y
 2/xE2ghIDjLku7efASp091rLtXflyk0KYvioIBVCaCdKHDo0iD2TdSDNLgo5SkwJA3Qh
 xHiHFXLFZ7x3/zl9/JjcFxQLYq6di1h4AfsaVcCiUrKqHaP912T2B/gXOIzPoRX0JvIz
 +1C2H4eQHj06AqB7EQTqkXAHtbc6Uel0hDIRBKx5GXzgFW50ClM36TxwJYAw90kK0vJI
 1M8A==
X-Gm-Message-State: AJIora8XocFO7/gvVyAqOe7bPpQ+LRIwfCUM2z5knlS+O5W2+QPmZVJV
 aoVeWsgxfrh5HGiMP/TtawA/L/lgT32QY08H
X-Google-Smtp-Source: AGRyM1uHyWpLQiK00h4h0pE83Je3LER80zo9/dNrizYwq8DrdsQMhfqEzeRNIWBWp/EcLjIdDxkaPQ==
X-Received: by 2002:a17:907:7245:b0:726:a909:902e with SMTP id
 ds5-20020a170907724500b00726a909902emr9883056ejc.308.1656606872695; 
 Thu, 30 Jun 2022 09:34:32 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52]) by smtp.gmail.com with ESMTPSA id
 qh17-20020a170906ecb100b00726e51b6d7dsm3412309ejb.195.2022.06.30.09.34.27
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 09:34:30 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id q9so28128750wrd.8
 for <cluster-devel@redhat.com>; Thu, 30 Jun 2022 09:34:27 -0700 (PDT)
X-Received: by 2002:a05:6000:1148:b0:21b:a4b2:ccd3 with SMTP id
 d8-20020a056000114800b0021ba4b2ccd3mr9386518wrx.193.1656606867259; Thu, 30
 Jun 2022 09:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220630135934.1799248-1-aahringo@redhat.com>
In-Reply-To: <20220630135934.1799248-1-aahringo@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 30 Jun 2022 09:34:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjZfO9hGqJ2_hGQG3U_XzSh9_XaXze=HgPdvJbgrvASfA@mail.gmail.com>
Message-ID: <CAHk-=wjZfO9hGqJ2_hGQG3U_XzSh9_XaXze=HgPdvJbgrvASfA@mail.gmail.com>
To: Alexander Aring <aahringo@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Cluster-devel] [RFC 0/2] refcount: attempt to avoid imbalance
 warnings
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 cluster-devel <cluster-devel@redhat.com>,
 Sparse Mailing-list <linux-sparse@vger.kernel.org>, thunder.leizhen@huawei.com,
 jacob.e.keller@intel.com, Andrew Morton <akpm@linux-foundation.org>,
 Will Deacon <will@kernel.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="000000000000db535805e2acd76b"

--000000000000db535805e2acd76b
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 30, 2022 at 6:59 AM Alexander Aring <aahringo@redhat.com> wrote:
>
> I send this patch series as RFC because it was necessary to do a kref
> change after adding __cond_lock() to refcount_dec_and_lock()
> functionality.

Can you try something like this instead?

This is two separate patches - one for sparse, and one for the kernel.

This is only *very* lightly tested (ie I tested it on a single kernel
file that used refcount_dec_and_lock())

                Linus

--000000000000db535805e2acd76b
Content-Type: text/x-patch; charset="US-ASCII"; name="sparse.patch"
Content-Disposition: attachment; filename="sparse.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l518xtgt0>
X-Attachment-Id: f_l518xtgt0

IGxpbmVhcml6ZS5jICAgICAgICAgIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKy0tCiB2YWxp
ZGF0aW9uL2NvbnRleHQuYyB8IDE1ICsrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAz
NyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpbmVhcml6ZS5j
IGIvbGluZWFyaXplLmMKaW5kZXggZDlhZWQ2MWIuLjhkZDAwNWFmIDEwMDY0NAotLS0gYS9saW5l
YXJpemUuYworKysgYi9saW5lYXJpemUuYwpAQCAtMTUzNyw2ICsxNTM3LDggQEAgc3RhdGljIHBz
ZXVkb190IGxpbmVhcml6ZV9jYWxsX2V4cHJlc3Npb24oc3RydWN0IGVudHJ5cG9pbnQgKmVwLCBz
dHJ1Y3QgZXhwcmVzc2kKIAlhZGRfb25lX2luc24oZXAsIGluc24pOwogCiAJaWYgKGN0eXBlKSB7
CisJCXN0cnVjdCBiYXNpY19ibG9jayAqcG9zdF9jYWxsID0gTlVMTDsKKwogCQlGT1JfRUFDSF9Q
VFIoY3R5cGUtPmNvbnRleHRzLCBjb250ZXh0KSB7CiAJCQlpbnQgaW4gPSBjb250ZXh0LT5pbjsK
IAkJCWludCBvdXQgPSBjb250ZXh0LT5vdXQ7CkBAIC0xNTQ3LDggKzE1NDksMjEgQEAgc3RhdGlj
IHBzZXVkb190IGxpbmVhcml6ZV9jYWxsX2V4cHJlc3Npb24oc3RydWN0IGVudHJ5cG9pbnQgKmVw
LCBzdHJ1Y3QgZXhwcmVzc2kKIAkJCQlpbiA9IDA7CiAJCQl9CiAJCQlpZiAob3V0IDwgMCkgewot
CQkJCWNoZWNrID0gMDsKLQkJCQlvdXQgPSAwOworCQkJCXN0cnVjdCBiYXNpY19ibG9jayAqc2V0
X2NvbnRleHQ7CisJCQkJaWYgKHJldHZhbCA9PSBWT0lEKSB7CisJCQkJCXdhcm5pbmcoZXhwci0+
cG9zLCAibm9uc2Vuc2ljYWwgY29uZGl0aW9uYWwgb3V0cHV0IGNvbnRleHQgd2l0aCBubyBjb25k
aXRpb24iKTsKKwkJCQkJYnJlYWs7CisJCQkJfQorCQkJCWlmIChjaGVjayB8fCBpbikgeworCQkJ
CQl3YXJuaW5nKGV4cHItPnBvcywgIm5vbnNlbnNpY2FsIGNvbmRpdGlvbmFsIGlucHV0IGNvbnRl
eHQiKTsKKwkJCQkJYnJlYWs7CisJCQkJfQorCQkJCWlmICghcG9zdF9jYWxsKQorCQkJCQlwb3N0
X2NhbGwgPSBhbGxvY19iYXNpY19ibG9jayhlcCwgZXhwci0+cG9zKTsKKwkJCQlzZXRfY29udGV4
dCA9IGFsbG9jX2Jhc2ljX2Jsb2NrKGVwLCBleHByLT5wb3MpOworCQkJCWFkZF9icmFuY2goZXAs
IHJldHZhbCwgc2V0X2NvbnRleHQsIHBvc3RfY2FsbCk7CisJCQkJc2V0X2FjdGl2ZWJsb2NrKGVw
LCBzZXRfY29udGV4dCk7CisJCQkJb3V0ID0gLW91dDsKIAkJCX0KIAkJCWNvbnRleHRfZGlmZiA9
IG91dCAtIGluOwogCQkJaWYgKGNoZWNrIHx8IGNvbnRleHRfZGlmZikgewpAQCAtMTU2MCw2ICsx
NTc1LDExIEBAIHN0YXRpYyBwc2V1ZG9fdCBsaW5lYXJpemVfY2FsbF9leHByZXNzaW9uKHN0cnVj
dCBlbnRyeXBvaW50ICplcCwgc3RydWN0IGV4cHJlc3NpCiAJCQl9CiAJCX0gRU5EX0ZPUl9FQUNI
X1BUUihjb250ZXh0KTsKIAorCQlpZiAocG9zdF9jYWxsKSB7CisJCQlhZGRfZ290byhlcCwgcG9z
dF9jYWxsKTsKKwkJCXNldF9hY3RpdmVibG9jayhlcCwgcG9zdF9jYWxsKTsKKwkJfQorCiAJCWlm
IChjdHlwZS0+bW9kaWZpZXJzICYgTU9EX05PUkVUVVJOKQogCQkJYWRkX3VucmVhY2hhYmxlKGVw
KTsKIAl9CmRpZmYgLS1naXQgYS92YWxpZGF0aW9uL2NvbnRleHQuYyBiL3ZhbGlkYXRpb24vY29u
dGV4dC5jCmluZGV4IGI5NTAwZGM3Li5mODk2MmYxOSAxMDA2NDQKLS0tIGEvdmFsaWRhdGlvbi9j
b250ZXh0LmMKKysrIGIvdmFsaWRhdGlvbi9jb250ZXh0LmMKQEAgLTEwLDYgKzEwLDEwIEBAIHN0
YXRpYyB2b2lkIHIodm9pZCkgX19hdHRyaWJ1dGVfXygoY29udGV4dCgxLDApKSkKIAlfX2NvbnRl
eHRfXygtMSk7CiB9CiAKKy8vIE5lZ2F0aXZlIG91dHB1dCBtZWFucyAiY29uZGl0aW9uYWwgcG9z
aXRpdmUgb3V0cHV0IgorZXh0ZXJuIGludCBjb25kX2dldCh2b2lkKSBfX2F0dHJpYnV0ZSgoY29u
dGV4dCgwLC0xKSkpOworZXh0ZXJuIHZvaWQgbm9uc2Vuc2ljYWxfY29uZF9nZXQodm9pZCkgX19h
dHRyaWJ1dGUoKGNvbnRleHQoMCwtMSkpKTsKKwogZXh0ZXJuIGludCBfY2EoaW50IGZhaWwpOwog
I2RlZmluZSBjYShmYWlsKSBfX2NvbmRfbG9jayhfY2EoZmFpbCkpCiAKQEAgLTE5LDYgKzIzLDE3
IEBAIHN0YXRpYyB2b2lkIGdvb2RfcGFpcmVkMSh2b2lkKQogCXIoKTsKIH0KIAorc3RhdGljIHZv
aWQgZ29vZF9jb25kaXRpb25hbCh2b2lkKQoreworCWlmIChjb25kX2dldCgpKQorCQlyKCk7Cit9
CisKK3N0YXRpYyB2b2lkIG5vbnNlbnNpY2FsX2NvbmRpdGlvbmFsKHZvaWQpCit7CisJbm9uc2Vu
c2ljYWxfY29uZF9nZXQoKTsKK30KKwogc3RhdGljIHZvaWQgZ29vZF9wYWlyZWQyKHZvaWQpCiB7
CiAJYSgpOwo=
--000000000000db535805e2acd76b
Content-Type: text/x-patch; charset="US-ASCII"; name="kernel.patch"
Content-Disposition: attachment; filename="kernel.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l518xy841>
X-Attachment-Id: f_l518xy841

IGluY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaCB8IDIgKysKIGluY2x1ZGUvbGludXgvcmVm
Y291bnQuaCAgICAgICB8IDYgKysrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5
cGVzLmggYi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmgKaW5kZXggZDA4ZGZjYjBhYzY4
Li40ZjJhODE5ZmQ2MGEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMu
aAorKysgYi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmgKQEAgLTI0LDYgKzI0LDcgQEAg
c3RhdGljIGlubGluZSB2b2lkIF9fY2hrX2lvX3B0cihjb25zdCB2b2xhdGlsZSB2b2lkIF9faW9t
ZW0gKnB0cikgeyB9CiAvKiBjb250ZXh0L2xvY2tpbmcgKi8KICMgZGVmaW5lIF9fbXVzdF9ob2xk
KHgpCV9fYXR0cmlidXRlX18oKGNvbnRleHQoeCwxLDEpKSkKICMgZGVmaW5lIF9fYWNxdWlyZXMo
eCkJX19hdHRyaWJ1dGVfXygoY29udGV4dCh4LDAsMSkpKQorIyBkZWZpbmUgX19jb25kX2FjcXVp
cmVzKHgpIF9fYXR0cmlidXRlX18oKGNvbnRleHQoeCwwLC0xKSkpCiAjIGRlZmluZSBfX3JlbGVh
c2VzKHgpCV9fYXR0cmlidXRlX18oKGNvbnRleHQoeCwxLDApKSkKICMgZGVmaW5lIF9fYWNxdWly
ZSh4KQlfX2NvbnRleHRfXyh4LDEpCiAjIGRlZmluZSBfX3JlbGVhc2UoeCkJX19jb250ZXh0X18o
eCwtMSkKQEAgLTUwLDYgKzUxLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIF9fY2hrX2lvX3B0cihj
b25zdCB2b2xhdGlsZSB2b2lkIF9faW9tZW0gKnB0cikgeyB9CiAvKiBjb250ZXh0L2xvY2tpbmcg
Ki8KICMgZGVmaW5lIF9fbXVzdF9ob2xkKHgpCiAjIGRlZmluZSBfX2FjcXVpcmVzKHgpCisjIGRl
ZmluZSBfX2NvbmRfYWNxdWlyZXMoeCkKICMgZGVmaW5lIF9fcmVsZWFzZXMoeCkKICMgZGVmaW5l
IF9fYWNxdWlyZSh4KQkodm9pZCkwCiAjIGRlZmluZSBfX3JlbGVhc2UoeCkJKHZvaWQpMApkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9yZWZjb3VudC5oIGIvaW5jbHVkZS9saW51eC9yZWZjb3Vu
dC5oCmluZGV4IGI4YTZlMzg3ZjhmOS4uYTYyZmNjYTk3NDg2IDEwMDY0NAotLS0gYS9pbmNsdWRl
L2xpbnV4L3JlZmNvdW50LmgKKysrIGIvaW5jbHVkZS9saW51eC9yZWZjb3VudC5oCkBAIC0zNjEs
OSArMzYxLDkgQEAgc3RhdGljIGlubGluZSB2b2lkIHJlZmNvdW50X2RlYyhyZWZjb3VudF90ICpy
KQogCiBleHRlcm4gX19tdXN0X2NoZWNrIGJvb2wgcmVmY291bnRfZGVjX2lmX29uZShyZWZjb3Vu
dF90ICpyKTsKIGV4dGVybiBfX211c3RfY2hlY2sgYm9vbCByZWZjb3VudF9kZWNfbm90X29uZShy
ZWZjb3VudF90ICpyKTsKLWV4dGVybiBfX211c3RfY2hlY2sgYm9vbCByZWZjb3VudF9kZWNfYW5k
X211dGV4X2xvY2socmVmY291bnRfdCAqciwgc3RydWN0IG11dGV4ICpsb2NrKTsKLWV4dGVybiBf
X211c3RfY2hlY2sgYm9vbCByZWZjb3VudF9kZWNfYW5kX2xvY2socmVmY291bnRfdCAqciwgc3Bp
bmxvY2tfdCAqbG9jayk7CitleHRlcm4gX19tdXN0X2NoZWNrIGJvb2wgcmVmY291bnRfZGVjX2Fu
ZF9tdXRleF9sb2NrKHJlZmNvdW50X3QgKnIsIHN0cnVjdCBtdXRleCAqbG9jaykgX19jb25kX2Fj
cXVpcmVzKGxvY2spOworZXh0ZXJuIF9fbXVzdF9jaGVjayBib29sIHJlZmNvdW50X2RlY19hbmRf
bG9jayhyZWZjb3VudF90ICpyLCBzcGlubG9ja190ICpsb2NrKSBfX2NvbmRfYWNxdWlyZXMobG9j
ayk7CiBleHRlcm4gX19tdXN0X2NoZWNrIGJvb2wgcmVmY291bnRfZGVjX2FuZF9sb2NrX2lycXNh
dmUocmVmY291bnRfdCAqciwKIAkJCQkJCSAgICAgICBzcGlubG9ja190ICpsb2NrLAotCQkJCQkJ
ICAgICAgIHVuc2lnbmVkIGxvbmcgKmZsYWdzKTsKKwkJCQkJCSAgICAgICB1bnNpZ25lZCBsb25n
ICpmbGFncykgX19jb25kX2FjcXVpcmVzKGxvY2spOwogI2VuZGlmIC8qIF9MSU5VWF9SRUZDT1VO
VF9IICovCg==
--000000000000db535805e2acd76b--

